Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 890837BB38A
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 10:52:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E58A81EB;
	Fri,  6 Oct 2023 10:51:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E58A81EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696582341;
	bh=hvG6bm4WuGo4ixo72tk5/Z7tpYaYvdVxv8c+v/E6UeA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DnWoTGX82JqjK9zngObJUF5bg9zYURy7OdFdRXgR6TgMHTYWkAnVRZzZVMdtnBb/+
	 XpiVljB35thCvm1mmnZnloA+e/OHqyPzNNN0ILYbPsfyyXrPK7R6QalVsMbioJ9jAj
	 yfWxFjQjoSCipPR6ggJU0CB/eoCTxkX2wpD+k8HY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A30C2F80557; Fri,  6 Oct 2023 10:51:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F7C2F80310;
	Fri,  6 Oct 2023 10:51:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0B56F8047D; Fri,  6 Oct 2023 10:51:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E21D7F801EB
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 10:50:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E21D7F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=NkCtdR3+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=c6GSbyzE
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5354C21866;
	Fri,  6 Oct 2023 08:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1696582259;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lrPVGs9PEDT/K6IOorzhQy/e4LFHokzpzNfy48DoQ1A=;
	b=NkCtdR3+ZzpvrTElBT0GbSq52+J3kim3CcY1njUTx8njN44RrETFaRTSkKfECLBxFBkhFQ
	jjgk+sD08j3AIjkW0rkLbHQVBxTQHlv7Y4FTOcljaFHcL/Z/n7Zr10x6KEbCliPuqZrC6t
	hBmn5RWYI0hVeJn1ZOyUv0IIMZZjR9M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1696582259;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lrPVGs9PEDT/K6IOorzhQy/e4LFHokzpzNfy48DoQ1A=;
	b=c6GSbyzE9wz5ZlvF84cfbAiDqZhrid7HsujzNW2gwhy4JSE+YoQ8YXXGbDNaPTQECW696v
	KhfgAPURWj4xdcDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 15B1313A2E;
	Fri,  6 Oct 2023 08:50:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id LztfBHPKH2UKIwAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 06 Oct 2023 08:50:59 +0000
Date: Fri, 06 Oct 2023 10:50:58 +0200
Message-ID: <87ttr4w2vh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thomas Perl <m@thp.io>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"trivial@kernel.org" <trivial@kernel.org>
Subject: Re: [PATCH] sound: fix name of SIS7013 sound chip in comment
In-Reply-To: <5E4B5CA1-1109-4C82-A581-838ACF19A15D@thp.io>
References: <5E4B5CA1-1109-4C82-A581-838ACF19A15D@thp.io>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: FXGKVXAP7JQPQ3EB7V3PM65F4VU4VNBQ
X-Message-ID-Hash: FXGKVXAP7JQPQ3EB7V3PM65F4VU4VNBQ
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FXGKVXAP7JQPQ3EB7V3PM65F4VU4VNBQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 27 Sep 2023 09:17:32 +0200,
Thomas Perl wrote:
> 
> While grep'ing for SIS7012, I noticed that there is
> only one reference to it in sound/pci/intel8x0m.c,
> while most of its code lives in sound/pci/intel8x0.c.
> 
> This probably was a simple copy'n'paste mistake, as
> the sound/pci/intel8x0m.c driver implements support
> for SIS7013 (see DEVICE_SIS), and the two devices
> seem to share the same behavior / registers.
> 
> Signed-off-by: Thomas Perl <m@thp.io>

Thanks for the patch.

Unfortunately the patch isn't applicable cleanly, likely due to your
mailer malformed the spaces.  As it's a really trivial change, I fixed
manually now.  But, at the next time, please try to fix your mailer
setup and at best test the patch application by yourself beforehand.


Takashi



> ---
>  sound/pci/intel8x0m.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/pci/intel8x0m.c b/sound/pci/intel8x0m.c
> index 2845cc006d0c..653ecca78238 100644
> --- a/sound/pci/intel8x0m.c
> +++ b/sound/pci/intel8x0m.c
> @@ -918,7 +918,7 @@ static int snd_intel8x0m_ich_chip_init(struct intel8x0m *chip, int probing)
>   }
>     if (chip->device_type == DEVICE_SIS) {
> - /* unmute the output on SIS7012 */
> + /* unmute the output on SIS7013 */
>   iputword(chip, 0x4c, igetword(chip, 0x4c) | 1);
>   }
>   --  2.39.2
> 
