Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDD17780DF
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 20:57:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A70F0843;
	Thu, 10 Aug 2023 20:56:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A70F0843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691693846;
	bh=IsK5G9QDEXWBnjqWS3cLXM3HVwNlvSCPlHJrokHTodM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vkn+Ib2ZC94HEHdaKTm+ooUmcIjS/SHZYyQJWgb/vms4Hsvhf7DvPcq0T7tFRgRwy
	 ssM+Jq7nTl2EErlwN1M703kqedsNfiibkLPnr3Rmkf3w84GVxw2kAlbhZu62lhsTxS
	 FqkZ5bnauGrl6sBbddDEFCfb54lzLUacFcj2wCgY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48DA0F80579; Thu, 10 Aug 2023 20:55:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99E46F80564;
	Thu, 10 Aug 2023 20:55:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C647F800F4; Thu, 10 Aug 2023 20:55:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 664DDF80166
	for <alsa-devel@alsa-project.org>; Thu, 10 Aug 2023 20:55:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 664DDF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=igorinstitute-com.20221208.gappssmtp.com
 header.i=@igorinstitute-com.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=KV353QEf
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-686b91c2744so957750b3a.0
        for <alsa-devel@alsa-project.org>;
 Thu, 10 Aug 2023 11:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=igorinstitute-com.20221208.gappssmtp.com; s=20221208; t=1691693735;
 x=1692298535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ReLwi2nvTkOckww+x2LbKPx0bCg4S+W6rG96SqGnBrY=;
        b=KV353QEfqmzmRDXwuUhtVSxqUDg0evBEzH0jZ04juRUo9tCElN8GRRGqK/N6NxUkNx
         oL31uSnV8Ouba8maoaDErcxmUbtXWckjb9PPwicwrmsPiyC0Vxx4l/qwNKbQmcDIVjCa
         GSkxjA4hWn6F3++wQGpkJdRaLiIF4UMYzODbxSRPWeMLkg0Cn+s5g7Mc7W88plrHrBZo
         dvt4Sj+CQzBbvlibPz6lrnLCoruXX4lQ0Bf/+CEvnPP4Pgxf7LIeHHyGozSb73ZpLVKR
         UAV7cPlTBTPung/mB7WdzrV2hsOYQsyySRqgH4fFCv6lr1Ox4gCyLIWjgQQ8XP0A03Ji
         UyPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691693735; x=1692298535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ReLwi2nvTkOckww+x2LbKPx0bCg4S+W6rG96SqGnBrY=;
        b=exhZ5ef3WXWudrelgsg0JODgwcYzg1uBTEdQkjfzrfZWyUtvereuqVNlVSlskf5MyY
         wiNBDoQkJhS6qLV856Rhs5G8Qni32v5dLy6+z1T2N9pVQyuRoPgoUUPqgVzjc1EWqZaQ
         sVIpY6pTrUhMlSADn+koC8MFjJYIs4t1euauzG2SJWOfsiK7gEeTfsgr1e8p2LIyv23p
         ZR7JX4OOb02cYjp9RfOlUxlpy9LzUtF9FL95Hq2lnpHUDKfi43o84cSluBU8vBsoXgZA
         2s8xgxumtne2Up0QoVh6msZrlcWa4/bUCpeMiIMNSavXekpKv8WgF6pJfmKFwtKFj+4E
         KDBQ==
X-Gm-Message-State: AOJu0YxpaE5fgWx+S5Gu1hC5D9G9zKxgEEmU7mLb4LpHGNeLC2ReSkCs
	HgoKqAaJeusVusxXGO0B3Y2DEg==
X-Google-Smtp-Source: 
 AGHT+IFuJAoeh/LPAGg6Z3Eb3PcBlWQ6qffS4pImhkNjVJAUdV/2y2ul8gNZ6QkBCPLOBinXZDDDIg==
X-Received: by 2002:a05:6a20:13d8:b0:12d:23ea:9ccc with SMTP id
 ho24-20020a056a2013d800b0012d23ea9cccmr3037690pzc.39.1691693734583;
        Thu, 10 Aug 2023 11:55:34 -0700 (PDT)
Received: from localhost ([2407:7000:825d:4900:3d80:aa52:cfc7:4e30])
        by smtp.gmail.com with ESMTPSA id
 t27-20020aa7939b000000b006826df9e286sm1912610pfe.143.2023.08.10.11.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 11:55:34 -0700 (PDT)
Date: Fri, 11 Aug 2023 06:55:30 +1200
From: Daniel Beer <daniel.beer@igorinstitute.com>
To: Li Zetao <lizetao1@huawei.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	pierre-louis.bossart@linux.intel.com,
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com,
	kai.vehmanen@linux.intel.com, Jonathan.Cameron@huawei.com,
	luca.ceresoli@bootlin.com, luzmaximilian@gmail.com,
	u.kleine-koenig@pengutronix.de, alsa-devel@alsa-project.org,
	sound-open-firmware@alsa-project.org
Subject: Re: [PATCH -next 1/2] ASoC: tas5805m: Use devm_kmemdup to replace
 devm_kmalloc + memcpy
Message-ID: <ZNUyor9WYmeBrxg/@fermat.nev>
References: <20230810114738.2103792-1-lizetao1@huawei.com>
 <20230810114738.2103792-2-lizetao1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230810114738.2103792-2-lizetao1@huawei.com>
Message-ID-Hash: 673BTKSQPME4BLQS3UPTAAU7W3YJXIWL
X-Message-ID-Hash: 673BTKSQPME4BLQS3UPTAAU7W3YJXIWL
X-MailFrom: daniel.beer@igorinstitute.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/673BTKSQPME4BLQS3UPTAAU7W3YJXIWL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Aug 10, 2023 at 07:47:37PM +0800, Li Zetao wrote:
> -	tas5805m->dsp_cfg_data = devm_kmalloc(dev, fw->size, GFP_KERNEL);
> +	tas5805m->dsp_cfg_data = devm_kmemdup(dev, fw->data, fw->size, GFP_KERNEL);
>  	if (!tas5805m->dsp_cfg_data) {
>  		release_firmware(fw);
>  		return -ENOMEM;
>  	}
> -	memcpy(tas5805m->dsp_cfg_data, fw->data, fw->size);
>  
>  	release_firmware(fw);

You could probably now move the release_firmware call to be immediately
after the devm_kmemdup attempt, and avoid having to call it from two
different places.

Cheers,
Daniel

-- 
Daniel Beer
Firmware Engineer at Igor Institute
daniel.beer@igorinstitute.com or +64-27-420-8101
Offices in Seattle, San Francisco, and Vancouver BC or (206) 494-3312
