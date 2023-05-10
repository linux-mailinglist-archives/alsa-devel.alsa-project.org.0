Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 553B36FE34A
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 19:31:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E23910A4;
	Wed, 10 May 2023 19:30:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E23910A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683739867;
	bh=QlnKL8/OiX18G0FaOuF5T/wlbj1Lt3LFGNby1vtTprQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OOXUpYgvblQ65nfAet/1z4fj3xmyEZGD83wj1kjiLJieWzOOlVsCVfNq31FhmNyWz
	 CAOy0lG5UwbKm9oKdIMt7IuUG1lpmoLGSC7o7cHF21Huf0wSDA8WE894HuOGDZNJgS
	 h9/1FJi0MGfG3tGbWrH2pPmdFK/IyVeqRtXhb43w=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 532DFF805B0;
	Wed, 10 May 2023 19:27:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7E70F804B1; Wed, 10 May 2023 18:43:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D673F802E8
	for <sound-open-firmware@alsa-project.org>;
 Wed, 10 May 2023 18:43:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D673F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=google header.b=hKtjrSTg
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6436e004954so7694198b3a.0
        for <sound-open-firmware@alsa-project.org>;
 Wed, 10 May 2023 09:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683737009; x=1686329009;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YBcR8ayaefdH06zCZy51ugeFj/F9kPbd1VzOuOZTQ0U=;
        b=hKtjrSTg5lgI8bbQOVyjuMXywBPiM6Pdid7hH+QNfyRDP7JB9GkBcFiDTI8WEeoSN3
         TamEvNQEAEobPECTKYljYGLFy6Se41GI9cjA2E63yZRFkTkZBPO6jnzjgiao6CSMo5J+
         STpjFmN8adAmIkp6RK0i4XWS/WroitlHa8Sy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683737009; x=1686329009;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YBcR8ayaefdH06zCZy51ugeFj/F9kPbd1VzOuOZTQ0U=;
        b=QfeOpETs05LeTTeecED95QCrg41CdftQZSNUlgjS3hgUlzo7jJ4seb51VW1enOfVTY
         amRpmTnJhAqUPYX98x7lEwxFx26u+xQQsC3hQqw1SgeUNe/0WIZuD6uOyMCHt+Uo2d0o
         Vl4lxYqX+cTXJVkBXcF0Blg1vix9BkADw4dHT5WYSLX2nRhKp3tfJiYUPRlWww4LVs3q
         k1HrVEjHlWtdTwIURPGJHMI5F24wSV2aIYG/IZbj4v3uf/f7nwSAMA2+cnFEfSO+CH+q
         jaeB8g9TXWMi3sGiUZzaneFdoL27mylHRy4dxCIRpjALRJBZk00zYMC7Eufb7rS3K/JE
         5UwA==
X-Gm-Message-State: AC+VfDwC2ZHY07xdpOiOP4VEM3ibZwAEFfciuLBz7NLqklXMhPGHhiIV
	MtaA14uH4DUySxdCCq1Vp7YRsw==
X-Google-Smtp-Source: 
 ACHHUZ6vkQuE4ePYE04ijmq4WXyn3AoO1TWcAVKaZtIzkw8HWEC5Ctb1bAJ3+EJ244jUu2IV5wmXng==
X-Received: by 2002:a05:6a20:938f:b0:103:9871:7403 with SMTP id
 x15-20020a056a20938f00b0010398717403mr1092808pzh.31.1683737009026;
        Wed, 10 May 2023 09:43:29 -0700 (PDT)
Received: from nitro.local ([2001:4958:15a0:30:e305:5a3c:4c5a:1bc7])
        by smtp.gmail.com with ESMTPSA id
 x12-20020a62fb0c000000b006436ffa3dc4sm3778552pfm.24.2023.05.10.09.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 09:43:28 -0700 (PDT)
Date: Wed, 10 May 2023 12:43:27 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>,
	alsa-devel@alsa-project.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 sound-open-firmware@alsa-project.org
Subject: Re: DMARC (Was: Re: [alsa-devel@alsa-project.org: [PATCH 3/5] ASoC:
 mediatek: mt8195-afe-pcm: Simplify runtime PM during probe])
Message-ID: <20230510-raked-loft-bureau-1c87fb@meerkat>
References: <87o7n0mtv9.wl-tiwai@suse.de>
 <87ednwmssr.wl-tiwai@suse.de>
 <87wn1jdzuq.wl-tiwai@suse.de>
 <e76c1395-5eb2-849e-120d-1b7389fc97c7@perex.cz>
 <ZFoUaNKBkIgbW0rD@finisterre.sirena.org.uk>
 <ff43dccf-ba6d-d7fa-352a-5d5a8c4b977f@perex.cz>
 <20230509-mug-private-mess-6a36d2@meerkat>
 <31969101-c1cf-4956-6446-2243ccda0c65@perex.cz>
 <20230510-robert-diane-joe-846d41@meerkat>
 <41443193-1c4a-bfea-f81c-e6658b7addee@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <41443193-1c4a-bfea-f81c-e6658b7addee@perex.cz>
X-MailFrom: konstantin@linuxfoundation.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-sound-open-firmware.alsa-project.org-0;
 header-match-sound-open-firmware.alsa-project.org-1
Message-ID-Hash: 5OGK45LKVO2DR6SLLX5NVU4OYL3EWNAJ
X-Message-ID-Hash: 5OGK45LKVO2DR6SLLX5NVU4OYL3EWNAJ
X-Mailman-Approved-At: Wed, 10 May 2023 17:27:10 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5OGK45LKVO2DR6SLLX5NVU4OYL3EWNAJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, May 10, 2023 at 06:19:15PM +0200, Jaroslav Kysela wrote:
> On 10. 05. 23 17:34, Konstantin Ryabitsev wrote:
> 
> > So, I'm just going to repeat this: operating a mailing list and remaining
> > DMARC compliant is perfectly possible, provided:
> > 
> > - the original message is DKIM-signed
> > - all existing headers are unmodified
> > - the message body is unmodified
> 
> Example of e-mail which is rejected by google's mx servers:
> 
> https://lore.kernel.org/alsa-devel/20230510142227.32945-1-vitalyr@opensource.cirrus.com/raw

Thank you for this example -- it plainly illustrates the problem, which is
that Mailman 3 mangles messages.

If you compare the above message with the message that passed via vger, you
will notice what went wrong:

    -CC:     <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
    -        <linux-kernel@vger.kernel.org>,
    -        Vitaly Rodionov <vitalyr@opensource.cirrus.com>
    +CC: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
    + linux-kernel@vger.kernel.org, Vitaly Rodionov <vitalyr@opensource.cirrus.com>

For some bizarre reason Mailman-3 decided to make the CC header "more pretty"
by stripping the angle brackets around addresses. Since it's a DKIM-signed
header, this invalidates the signature and results in DMARC violations.

The answer, unfortunately, is to stop using Mailman-3. It's not usable for
patch-based workflows.

-K
