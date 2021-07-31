Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 992D43DC8AB
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Aug 2021 00:39:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2992E18BB;
	Sun,  1 Aug 2021 00:38:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2992E18BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627771157;
	bh=OJWCLCt2G14rvFEiLnCN3rlRdE0CCGhjEd9CRexE3nE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pRfzjy2ihhJC4SsKIi3cgIpLFmFqZRtdDBA3S6n9btehBCftZsCYDK4BB5BH2teni
	 yF/2RMXO8xkv7/H0nKaPDlYaDtridCpMWKWcghaS7bQsEXIo2Q3jsHCh9MRrzEcplc
	 3eFmbTuZoTtF/MvdGmbZS9R9l5zqMXio6S6i4NvQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 687B1F802E7;
	Sun,  1 Aug 2021 00:37:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 657BEF80276; Sun,  1 Aug 2021 00:37:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, NICE_REPLY_A, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50EA6F80258
 for <alsa-devel@alsa-project.org>; Sun,  1 Aug 2021 00:37:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50EA6F80258
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WONB+z4H"
Received: by mail-ed1-x535.google.com with SMTP id y12so18940452edo.6
 for <alsa-devel@alsa-project.org>; Sat, 31 Jul 2021 15:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6lLe+rHssWUcn5b/BXs6pZlUkRWK+G0oCsWSSKALWrQ=;
 b=WONB+z4HuvpG76OJAWqoiGuVr7ThMQLQq4sDL+/UQf1CsTTfJ8bl6AnJ3sA+w4/tto
 7b5haPMUSwUCvxY5MK9KPS7FJPMqQf7bP+DTkJxoLxDrLx4GzAsE8LflX2VbiKAW57nS
 BD+8ALMdHqgWwMs9TN8z7fH7upW3BrwpCMPEGkZzwhVgpSfAVAnIVuAmS+ONamk38ggy
 /NDCLakTbY/bsY2UcyHbG8GU95USpBIkV4eUqAHni3JQbsKx1bNaMLd42+yXeJKlj/cG
 r1NsRnVGziLWC0VtdyCA6XhT7zpQaQoJCNVjbssJf7geV3g9KujTx2MV96HUmmXweYrS
 MCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6lLe+rHssWUcn5b/BXs6pZlUkRWK+G0oCsWSSKALWrQ=;
 b=E/ndKhYuBb5nDDFtPRcZ+5J07nBploIy+EYFAliSGqMboFUdwkRAxsodSm+Zoi8pW6
 Rhwk/F7bj8VzNwpgItt80iKxGa7qdl8mOlzQJJbvX5Y1+37cSaiBU2wqYH5W0UfNmwOW
 sZ0BpMX23snxcuadjvEVODgQuo6JXvX8Q6FD6PrKqGjNMomK3min/p3hvvIyU82W7Eet
 0vndJHenjUh2EPCuuWEkVEzi0Gs2M+x0oNQE+aTeaicK2m2jOZDg7MHwzZC9mDKz4Tu7
 da6kQyDNNPKa4FIBs6Ec/zzaFH542aXLi/EYl1QQdGHZ4/+KjYecdcGv3zYvpSVgTqUe
 MPXQ==
X-Gm-Message-State: AOAM532zw8rE6Hb4m+JFsH5ZeX0i+8JLP38n/5hRF7ODX3bFPTU/a454
 oUuMA+t6PSAhytB5YBV9J0g=
X-Google-Smtp-Source: ABdhPJxRpanT+2TmF7/YZB/GuNwYHhwjkV/RMWRcjcOH+UgWHU3rL+lye42x6n/vWFoyuNIM1X/x4g==
X-Received: by 2002:aa7:d519:: with SMTP id y25mr10703842edq.191.1627771056993; 
 Sat, 31 Jul 2021 15:37:36 -0700 (PDT)
Received: from ?IPv6:2a02:587:9423:c0e9:c6ad:2aee:cdfd:c016?
 ([2a02:587:9423:c0e9:c6ad:2aee:cdfd:c016])
 by smtp.gmail.com with ESMTPSA id t10sm1375201edv.34.2021.07.31.15.37.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 31 Jul 2021 15:37:36 -0700 (PDT)
Subject: Re: [PATCH] ALSA: hda/realtek: add mic quirk for Acer SF314-42
To: Alexander Monakov <amonakov@ispras.ru>
References: <20210721170141.24807-1-amonakov@ispras.ru>
From: Nikos Liolios <liolios.nk@gmail.com>
Message-ID: <d6f4a149-12f8-b0d6-477a-c16113511c4a@gmail.com>
Date: Sun, 1 Aug 2021 01:37:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210721170141.24807-1-amonakov@ispras.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, 21 Jul 2021 20:01:41 +0300,
Alexander Monakov <amonakov@ispras.ru> wrote:
> The Acer Swift SF314-42 laptop is using Realtek ALC255 codec. Add a
> quirk so microphone in a headset connected via the right-hand side jack
> is usable.
> 
> 
>  sound/pci/hda/patch_realtek.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index ab5113cccffa..87ad8469dbc5 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -8191,6 +8191,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x1025, 0x1308, "Acer Aspire Z24-890", ALC286_FIXUP_ACER_AIO_HEADSET_MIC),
>  	SND_PCI_QUIRK(0x1025, 0x132a, "Acer TravelMate B114-21", ALC233_FIXUP_ACER_HEADSET_MIC),
>  	SND_PCI_QUIRK(0x1025, 0x1330, "Acer TravelMate X514-51T", ALC255_FIXUP_ACER_HEADSET_MIC),
> +	SND_PCI_QUIRK(0x1025, 0x142b, "Acer Swift SF314-42", ALC255_FIXUP_ACER_MIC_NO_PRESENCE),
>  	SND_PCI_QUIRK(0x1025, 0x1430, "Acer TravelMate B311R-31", ALC256_FIXUP_ACER_MIC_NO_PRESENCE),
>  	SND_PCI_QUIRK(0x1025, 0x1466, "Acer Aspire A515-56", ALC255_FIXUP_ACER_HEADPHONE_AND_MIC),
>  	SND_PCI_QUIRK(0x1028, 0x0470, "Dell M101z", ALC269_FIXUP_DELL_M101Z),
> 
> base-commit: 62fb9874f5da54fdb243003b386128037319b219

Other quirks for Acer Swift (for Acer SWIFT SF314-54/55/56) they describe the model using capital letters ("SWIFT" instead of "Swift").
I do think that "Swift" is better than (caps locked) "SWIFT". Thinking to create a patch for it since I helped to create this mess.
From my understanding it only affects the dmesg of which quirk was used, nothing important, but lets keep code clean.

What do you think? Rename "SWIFT"s to "Swift"s?
If no disagreement or no reply I am doing it like tomorrow.





