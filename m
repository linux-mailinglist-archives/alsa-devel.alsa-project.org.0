Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7D565C031
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Jan 2023 13:50:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EB02DB46;
	Tue,  3 Jan 2023 13:50:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EB02DB46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672750257;
	bh=lg2rka+/oZ/+tGqaSEoly2UvP59alozn00J76AdY/4Q=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ly2BqjmUC8RNm6Vl68DYEZIf8W02/SXm3RqbR7K0TbcrWOBtSUwmXHztpuxJ+NlqN
	 VMayfdYv9QkwGGcQg0Lg/4p1VsEUD3NlG3UEZzNZoI5k5FTs4As/p533QUs/ZWkIBP
	 2gPoNN1GWQg5sPGEP0YzlWzqQUdUh/Y1C0JZqedI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5C94F800F8;
	Tue,  3 Jan 2023 13:50:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7667F804AA; Tue,  3 Jan 2023 13:50:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C6D3F800C0
 for <alsa-devel@alsa-project.org>; Tue,  3 Jan 2023 13:49:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C6D3F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=xc9iI98/; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=4Dt3mtDN
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C44F938C77;
 Tue,  3 Jan 2023 12:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672750198; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZEzIhKt2C2SI/WYm+OZI65abirl7ySTd6WBWg9jxJDk=;
 b=xc9iI98/J3TaTDSNEDN0tpUTzZ7pBlb4s9VbKSDV3irSxGxu9MC3m9O2xA+IJtK4WjsMcT
 5tNjAm6/QzaqS3AaXRVB2w8VU1GOg2ZvZUjSlUxgoZUDz5H76mxNRKCOwwizuxnWNebxdi
 +5l53mluriuk68EV6wYPYV1wBAeqD98=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672750198;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZEzIhKt2C2SI/WYm+OZI65abirl7ySTd6WBWg9jxJDk=;
 b=4Dt3mtDNy7NwTEv/sGp959JFzQTcPMqu6tgsJqvfJQvfdi2az26te36H/fdn0CADh6tjZ2
 9v2JJ+sVbixVE/DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 56B111392B;
 Tue,  3 Jan 2023 12:49:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5eHnE3YktGOeEgAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 03 Jan 2023 12:49:58 +0000
Date: Tue, 03 Jan 2023 13:49:57 +0100
Message-ID: <87v8lnrde2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oliver Neukum <oneukum@suse.com>
Subject: Re: [RFC PATCH 04/14] sound: usb: card: Introduce USB SND vendor op
 callbacks
In-Reply-To: <465bb512-2ea3-ebfc-4b21-7b493f019fc3@suse.com>
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
 <20221223233200.26089-5-quic_wcheng@quicinc.com>
 <80f92635-6d14-8ff3-17ac-de2e5b977947@suse.com>
 <87lemqxpet.wl-tiwai@suse.de>
 <ec632e64-2d9c-3f71-4fe7-e1c6acb81393@quicinc.com>
 <465bb512-2ea3-ebfc-4b21-7b493f019fc3@suse.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-usb@vger.kernel.org, bgoswami@quicinc.com,
 mathias.nyman@intel.com, gregkh@linuxfoundation.org, andersson@kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, agross@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Thinh.Nguyen@synopsys.com,
 quic_plai@quicinc.com, Wesley Cheng <quic_wcheng@quicinc.com>,
 linux-kernel@vger.kernel.org, quic_jackp@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, 03 Jan 2023 13:20:48 +0100,
Oliver Neukum wrote:
> 
> 
> 
> On 30.12.22 08:10, Wesley Cheng wrote:
> 
> > It may depend on how the offloading is implemented, but we do have a mechanism to force the audio stream off from the qc_usb_audio_offload. Regardless of if the UDEV is suspended first, or the USB backend, as long as we ensure that the offloading is disabled before entering suspend, I think that should be sufficient.
> 
> You would presumably output garbage, if the UDEV is asleep but the backend is not.
> 
>  
> > The reset_resume() path is fine.  Bus reset is going to cause a disconnect() callback in the offload driver, in which we already have the proper handling for ensuring the offload path is halted, and we reject any incoming stream start requests.
> 
> How? If we go the reset_resume() code path, we find that usb-audio does not make
> a difference between regular resume() and reset_resume()

Note that, for USB audio, there is no much difference between resume()
and reset_resume(), especially about the PCM stream handling that is
the main target for the offload (the mixer isn't handled there).
And for the PCM, we just set the power state for UAC3, and that's
all.  All the rest is handled by the PCM core handler as usual.


Takashi
