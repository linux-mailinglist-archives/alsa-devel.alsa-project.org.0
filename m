Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 977036B7B9B
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 16:12:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 883441463;
	Mon, 13 Mar 2023 16:11:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 883441463
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678720358;
	bh=JpK1Bsp/00/mAlSXP6iIotaNh7ZeAYHTZv65JHlesGE=;
	h=From:Date:Subject:To:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=QNzOHG2d9LYvlLbfrFJeDAtW7wGRlnkpEZ+fx4UnKc+u7MzPLtTKUoMXozYMYgnIf
	 iIH/h5Q0dLdOpyECc4qaS8ropIVKfnzgXAsbSFnmc/vbVbSy7M8ZopmTu4IHPHO1dC
	 xXlg3U7fvGtgQ9o4S+Qa/Yb4WP+2eVMWWVNvRc1Y=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DDFF1F8032D;
	Mon, 13 Mar 2023 16:11:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA882F80423; Mon, 13 Mar 2023 16:11:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E9E0DF80272
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 16:11:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9E0DF80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=YVauq20v
Received: by mail-ed1-x532.google.com with SMTP id j11so50059654edq.4
        for <alsa-devel@alsa-project.org>;
 Mon, 13 Mar 2023 08:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678720266;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iYwRBWhd/gnT5KWpDxu3GVM2rDxcHXfYBG+AZ04ghkU=;
        b=YVauq20vd4PDhA85eBFlplBg0czGyL0zg9UniRkUhD/8q9JeVYaJ5DCJ59+sCYxuBM
         lOfOGTME5ndTNy9GIBccH9Ufy9klp4bRUdzWCgAvWFIEfJ9lS/b+8TMtvcXOjyxlxUOx
         VGuOYRBgHBp+SzejDwroikBGvjSL7Sna9JaI+yxZ1m/yLVxIoqddnPu8H6ecLSaURVaW
         bF+Sm0JknLK+TMKa4MSSQYvls6jRI5fZjeUAA2EKrmb/cbhOz1vrPMYLuUUmNQNoiP0/
         Qs53oSmHruIit5g3LP1nU/mF+2ljOz8C3DuuV8ztzax7EXQ1M/x83x9IvzPTPX+t7/Mb
         qDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678720266;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iYwRBWhd/gnT5KWpDxu3GVM2rDxcHXfYBG+AZ04ghkU=;
        b=c/XfAaHyJ+NM9f9NOPGI6TLFkv4kWvthaf33Bm59JIaw0aT1RP1vk3U5MIN9gETuJg
         dbTEFlip3G530U8DZZic1F08KZxkcii8ymF2R5Ft36O4zna10vtExLqECdoMwt3Ml96S
         xSTT+/PIqqDUOTGYHGzYFHKFkMmSdf1Ory5wSuE3KF9G3ehP1wbSQfnkTHUkcLfwZ47B
         DbiWye6Fm7Wd7+p2cIq6wQ/j2oN/A+tih9asdkl1kMwXNwxTnYegCUmN9z8vWFNfVx7V
         VqaDBpD7M42ZS70md/Pe2mzubemZO+xxiv4ZMIaRNmdNq7NKuyBG2zngBBXu71F2E/WR
         /k/w==
X-Gm-Message-State: AO0yUKURW+j+Eki0CiblHVYlC5/+pwBSW7Bc7xuZr9hrnTqkOKeHqgCe
	j6wETjIfVbDHi2KHMgGa8I2M93NvWLQzC/clOqI=
X-Google-Smtp-Source: 
 AK7set+W24xs0TNecG9YLv4RTZC06WlcBwhmNY3iOLWhmk0Bev6pDw8huR+eRCMSzXMwY/sGw1em9mw4+QCG+sbRJtM=
X-Received: by 2002:a17:906:36d6:b0:8b2:23fb:dfd8 with SMTP id
 b22-20020a17090636d600b008b223fbdfd8mr17581155ejc.12.1678720266605; Mon, 13
 Mar 2023 08:11:06 -0700 (PDT)
MIME-Version: 1.0
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 13 Mar 2023 17:10:55 +0200
Message-ID: 
 <CAEnQRZBoo+v9JRztP_on7c_C_Laei5w8XAdZ7zaHxmGYAaKSeA@mail.gmail.com>
Subject: dpcm_be_connect: FE is atomic but BE is nonatomic,
 invalid configuration
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: HFA4WIPXTE4WT5TFWTSKNBQAOHAIAEBE
X-Message-ID-Hash: HFA4WIPXTE4WT5TFWTSKNBQAOHAIAEBE
X-MailFrom: daniel.baluta@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Paul Olaru <paul.olaru@nxp.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HFA4WIPXTE4WT5TFWTSKNBQAOHAIAEBE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Morimoto-san,

I would like to know your take on the following issue.

On I.MX with SOF we use simple-card and hit the following error:

  sai1-wm8960-hifi: dpcm_be_connect: FE is atomic but BE is nonatomic,
invalid configuration

and I think it makes sense to have the BE nonatomic as set by SOF core.

In order to fix this, we need to make FE nonatomic too. But FE is
handled by simple-card and it doesn't set .nonatomic field leaving it
as default (.nonatomic = 0).

How do you think we can update this field? Would a DT property be good enough?

thanks,
Daniel.
