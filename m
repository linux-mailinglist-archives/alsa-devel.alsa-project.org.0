Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 015E67DD4B6
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Oct 2023 18:32:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDFCA741;
	Tue, 31 Oct 2023 18:31:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDFCA741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698773561;
	bh=VVLkeqF/HET7powKC4i+zUCA0CimihoCLJDfXseYGbE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gF9GXGc2+cb3CNEAZX6yOd1+Tz2PFOmuYa+aed2sgxt4gg2l210VMrmAHkgdFE5Jy
	 riIAa7KOKHnYzRjho75+g/uEjx0YJKvXuyX8Um2+segLqwFda6MKbmAVaDdwvUkgT/
	 HroQh1Srx8CJCZGoc1wqHJyqlbxTaJmtosUvdVjM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CF2EF80557; Tue, 31 Oct 2023 18:31:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84B87F8016D;
	Tue, 31 Oct 2023 18:31:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35860F8020D; Tue, 31 Oct 2023 18:31:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD3DEF80152
	for <alsa-devel@alsa-project.org>; Tue, 31 Oct 2023 18:31:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD3DEF80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=LeYo5Jpz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=J/mYFyYk
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 14DBF1F38C;
	Tue, 31 Oct 2023 17:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1698773486;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FbLimeeIAWSKH++prZUBu8VvBLGBX6LRqI36ipCTUV8=;
	b=LeYo5Jpz/RT4uGrlS/D/o563bJTa1Ml8pINCAJHBiKepCeoVlxRMY8Mc90kANQEr2rWXfi
	+rOXuZPvuz1BMcbYrk+OYJ/94hcT9X+e3jJkE6/yl7El/IO9Kx7oE34Kqsc9a32eqokQC6
	1QoXaalIGEeL+WDHSiYsEtN7dynOsuQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1698773486;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FbLimeeIAWSKH++prZUBu8VvBLGBX6LRqI36ipCTUV8=;
	b=J/mYFyYkhcSt1achBAMLy5zw3k3LaiGZznv0/oxiBm/4dAgXbhPvmJrb10x2amv2f641py
	2rD+YyWQgPqvYSCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C60201391B;
	Tue, 31 Oct 2023 17:31:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id zhmFL+05QWXCdAAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 31 Oct 2023 17:31:25 +0000
Date: Tue, 31 Oct 2023 18:31:25 +0100
Message-ID: <87lebiwvf6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	kernel-janitors@vger.kernel.org,
	error27@gmail.com
Subject: Re: [PATCH next] ALSA: hda: cs35l41: Fix missing error code in
 cs35l41_smart_amp()
In-Reply-To: <20231030070836.3234385-1-harshit.m.mogalapalli@oracle.com>
References: <20231030070836.3234385-1-harshit.m.mogalapalli@oracle.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 5NWNK4PJX6XQDQFJNEIKNNNFC7R2PHPA
X-Message-ID-Hash: 5NWNK4PJX6XQDQFJNEIKNNNFC7R2PHPA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5NWNK4PJX6XQDQFJNEIKNNNFC7R2PHPA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 30 Oct 2023 08:08:36 +0100,
Harshit Mogalapalli wrote:
> 
> When firmware status is invalid, assign -EINVAL to ret as ret is '0' at
> that point and returning success is incorrect when firmware status is
> invalid.
> 
> Fixes: a51d8ba03a4f ("ALSA: hda: cs35l41: Check CSPL state after loading firmware")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>

Thanks, applied now.


Takashi


> ---
> This is found using smatch and only compile tested.
> ---
>  sound/pci/hda/cs35l41_hda.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
> index 496ff6a9d300..09f8d8fa4c71 100644
> --- a/sound/pci/hda/cs35l41_hda.c
> +++ b/sound/pci/hda/cs35l41_hda.c
> @@ -1042,6 +1042,7 @@ static int cs35l41_smart_amp(struct cs35l41_hda *cs35l41)
>  	default:
>  		dev_err(cs35l41->dev, "Firmware status is invalid: %u\n",
>  			fw_status);
> +		ret = -EINVAL;
>  		goto clean_dsp;
>  	}
>  
> -- 
> 2.39.3
> 
