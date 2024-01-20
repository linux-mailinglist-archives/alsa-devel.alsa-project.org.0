Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 824358332C9
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Jan 2024 05:56:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19B9D203;
	Sat, 20 Jan 2024 05:56:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19B9D203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705726586;
	bh=uGs0Jym9Pq2nUTiXuv+sEH3B9PiNQHqyC+RS4hOodEM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rXfZlB5qm5DIZiEVhJseD4fzLIcL7tu0u8bPJmVxT1yMz+Ww2zrCs2OKJIuG2AxpI
	 /ltCJI+nqe+mZTSKtW94KhUQU3sc0AIRnlCwPK2GZ02VYNJ1uDcdYesiGp7s4cdoae
	 tEYG7nPYeq5p/weQjQ9AWrHflz3bXFkAL/5XpBms=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94CD4F80587; Sat, 20 Jan 2024 05:55:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A041F80579;
	Sat, 20 Jan 2024 05:55:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92931F801F5; Sat, 20 Jan 2024 05:53:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5300DF80074
	for <alsa-devel@alsa-project.org>; Sat, 20 Jan 2024 05:53:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5300DF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Vitm/kRm
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1d711d7a940so13114345ad.1
        for <alsa-devel@alsa-project.org>;
 Fri, 19 Jan 2024 20:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705726388; x=1706331188;
 darn=alsa-project.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uGs0Jym9Pq2nUTiXuv+sEH3B9PiNQHqyC+RS4hOodEM=;
        b=Vitm/kRmREAhGUdAKY3UcZhwvyN5ZD8uFr8yWy2TrSf3ugEDarna3OX7+bRiWZMxyz
         xxFLOb9SWPej6+8icRH3sVgS87Unu7izi7WYbs7P0p/trIO/7LnVEqLMjB1QWjByJd8S
         kF2vjDDaJlOQ5rc3l8dAQUPBDweiDBGvxdBYUuc7FbqPILCBbZHTELy2vfhJ1ibnDKIz
         s+rerc/WDWGC2uBJDfk7TMlzuwLtwWDHo8azE6DQ4kCgHwF0yvohgmVbP1UO890TzQlP
         jV2RWwLLwWmdFAoY1k6BJkJGDTdSnuxbCbPeVrsy3Lo3RERhX8+H/r+/1Hn1Wv03NGRD
         bn3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705726388; x=1706331188;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uGs0Jym9Pq2nUTiXuv+sEH3B9PiNQHqyC+RS4hOodEM=;
        b=EH1lYxEJU8eOO8Yg0Zc5bhDw+92BdenYS085N38+1+OvLn8SLF2eIreElLKHieZbqD
         QkKXpBmXafMaO028y6hzFXsxbCCd+x3l2m5DcVKcStQIPCogZz/CGs6ug2lZQblh64v3
         IL10yE5Tf9TSWGI+CK9y59LRuPS5C+ZuWis11GKnqf/AtzAC5oco6KTS0Zx5dTcfI9x7
         Gwwc7get4lYIDsGmFkbWixeTIzJYTN5h7Yj4DQx1J/pMX6awsRa5+4wEpzphlYJX3t0d
         7wjNHI0xQbFJQYvPlssR1cyzf+ySNMCPnD4M7GuU275+UuaUZZGk2YCUj4E8oEhjH3Gv
         Kj5A==
X-Gm-Message-State: AOJu0YzrX5hqapO1clw9lhM3uIvo4bpPaKfYnT+iDwz0s7TA9dYU5g4/
	wivmxdvcbm5dHXdAmuAisXWyqplqf9FfIAcrSeCTDm+M6+cPU9vOR3pqaiCxP+Iy5g==
X-Google-Smtp-Source: 
 AGHT+IGkHkNREYj4AewwC8vvkplXC6GHBZsyXRW7NrzixIJYXo28YYMYpB6GXzx8BS7d58MyfJ2VlQ==
X-Received: by 2002:a17:902:e5d1:b0:1d7:3131:4de3 with SMTP id
 u17-20020a170902e5d100b001d731314de3mr192729plf.121.1705726388530;
        Fri, 19 Jan 2024 20:53:08 -0800 (PST)
Received: from zy-virtual-machine.localdomain ([222.70.13.170])
        by smtp.gmail.com with ESMTPSA id
 mp8-20020a170902fd0800b001d5efc7b8eesm3808472plb.305.2024.01.19.20.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 20:53:08 -0800 (PST)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com
Subject: RE: [PATCH 3/5] ASoC: codecs: ES8326: Adding new volume kcontrols
Date: Sat, 20 Jan 2024 12:53:03 +0800
Message-Id: <20240120045303.10501-1-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <lkp@intel.com>
References: <lkp@intel.com>
Message-ID-Hash: WHCUKS3QGE3EVWBOHUFL5GRH4TWWEDD3
X-Message-ID-Hash: WHCUKS3QGE3EVWBOHUFL5GRH4TWWEDD3
X-MailFrom: zhuning0077@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WHCUKS3QGE3EVWBOHUFL5GRH4TWWEDD3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> kernel test robot noticed the following build errors:
> [auto build test ERROR on broonie-sound/for-next]
> [also build test ERROR on tiwai-sound/for-next tiwai-sound/for-linus linus/master next-20240119]
> [cannot apply to v6.7]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> url: https://github.com/intel-lab-lkp/linux/commits/Zhu-Ning/ASoC-codecs-ES8326-improving-crosstalk-performance/20240119-193247
> base: https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> patch link: https://lore.kernel.org/r/20240119112858.2982-4-zhuning0077%40gmail.com
> patch subject: [PATCH 3/5] ASoC: codecs: ES8326: Adding new volume kcontrols
> config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240120/202401201033.SJS8Mtlr-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401201033.SJS8Mtlr-lkp@intel.com/reproduce)
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202401201033.SJS8Mtlr-lkp@intel.com/

I'm so sorry for my mistake.I'll fix it in the new version of the same patch/commit.
