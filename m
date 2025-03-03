Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 180A7A4FA5A
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Mar 2025 10:39:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F2E26037C;
	Wed,  5 Mar 2025 10:39:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F2E26037C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741167565;
	bh=DCnY5SpnzBNuJ9pFfR/UVnK2Suae29zUl4qaYrvn/bY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=EDpPqEjyagEYF3C80kSTZjZxEir1Woi8Mf16ICkTL1OufXkFyw85dKeRE34vg1YEN
	 o3Z/VLcx6/6qCpF6LScNzL1HPqFjybjsUJjCb7vDposmse/srhVPA2JgxI8emYcUpN
	 0qfxhPpaM92StbnUw+Z3ct7PxICfNSFWLVCnZGTE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9ECF7F8076A; Wed,  5 Mar 2025 10:36:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7ABF1F80760;
	Wed,  5 Mar 2025 10:36:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5FB2F80424; Mon,  3 Mar 2025 09:58:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp134-100.sina.com.cn (smtp134-100.sina.com.cn
 [180.149.134.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61124F800FA
	for <alsa-devel@alsa-project.org>; Mon,  3 Mar 2025 09:58:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61124F800FA
Received: from unknown (HELO
 zy-virtual-machine.localdomain)([180.159.108.137])
	by sina.net (10.185.250.32) with ESMTP
	id 67C56F2E0000046A; Mon, 3 Mar 2025 16:58:23 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: AFB447FF07394F2C901CA35AE16903FC
X-SMAIL-UIID: AFB447FF07394F2C901CA35AE16903FC-20250303-165823
From: Zhang Yi <zhangyi@everest-semi.com>
To: robh@kernel.org
Cc: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com
Subject: RE: [PATCH v1 2/2] ASoC: dt-bindings: Add Everest ES8389 audio CODEC
Date: Mon,  3 Mar 2025 16:58:20 +0800
Message-Id: <20250303085820.77981-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: NPEJOE4SKUUIC6OT5ROGPY62RRMA2PIX
X-Message-ID-Hash: NPEJOE4SKUUIC6OT5ROGPY62RRMA2PIX
X-Mailman-Approved-At: Wed, 05 Mar 2025 09:36:30 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NPEJOE4SKUUIC6OT5ROGPY62RRMA2PIX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> > +  everest,adc-slot:
> > +    $ref: /schemas/types.yaml#/definitions/uint8
> > +    description: |
> > +      This property is used to set the slots of recording data when multiple
> > +      codecs are connected in PTDM mode.
> > +      please set this property to default if you are setting STDM mode.
> > +    minimum: 0x00
> > +    maximum: 0x07
> > +    default: 0x00
> > +
> > +  everest,dac-slot:
> > +    $ref: /schemas/types.yaml#/definitions/uint8
> > +    description: |
> > +      This property is used to set the slots of playing data when multiple
> > +      codecs are connected in TDM mode.
> > +      please do not set this property if you use single codec.
> > +    minimum: 0x00
> > +    maximum: 0x07
> > +    default: 0x00
> 
> Can't the dai-tdm-* properties work for you?

We will register multiple codecs inside a single dai_link and differentiate these
codecs by of_node. so we can't use dai-tdm-slot* to define the slot for each codec

> > +
> > +  prefix_name:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description: device name prefix
> 
> Why do you need this?

When using multiple codecs, we utilize prefix_name to distinguish the dapm and
kcontro of each individual codec.
