Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9213587704A
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Mar 2024 11:17:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F13615FE;
	Sat,  9 Mar 2024 11:17:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F13615FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709979451;
	bh=xp/p94MyRNrAJWB5aG3QgKjRNzeXGBCxFqM4ZS0DcHU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gPbFwl9VmLJUkhk4AyY1PNYt/v6zC6MVfFJmQ+wnFXxcKO3p4M4XRJSaHWM+HDZV2
	 ymoYAaSF4kYuNjYGT1XQoacoE3OLvik22/LILqvDxPbhuQMb41JB/as2+3GIR54fz4
	 DnpvoA+hK1JICxrMgZoeDq6Nk0nDC/GNWngbGNUs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DBAFF80859; Sat,  9 Mar 2024 11:13:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 82594F808CC;
	Sat,  9 Mar 2024 11:13:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B250F8024E; Thu,  7 Mar 2024 04:04:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail78-66.sinamail.sina.com.cn (mail78-66.sinamail.sina.com.cn
 [219.142.78.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4F1E6F80087
	for <alsa-devel@alsa-project.org>; Thu,  7 Mar 2024 04:04:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F1E6F80087
Received: from unknown (HELO zy-virtual-machine.localdomain)([116.232.53.71])
	by sina.net (10.75.30.239) with ESMTP
	id 65E92EC7000245C2; Thu, 7 Mar 2024 11:04:40 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: D65A2737F131438A9504E79278B04227
X-SMAIL-UIID: D65A2737F131438A9504E79278B04227-20240307-110440
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	devicetree@vger.kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com
Subject: [PATCH v1 2/2] ASoC: codecs: ES8326: change support for ES8326
Date: Thu,  7 Mar 2024 11:04:38 +0800
Message-Id: <20240307030438.23228-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: JFSZZ5I7CNDSLLRJGHZE2LRDHTXXISWG
X-Message-ID-Hash: JFSZZ5I7CNDSLLRJGHZE2LRDHTXXISWG
X-Mailman-Approved-At: Sat, 09 Mar 2024 10:11:11 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JFSZZ5I7CNDSLLRJGHZE2LRDHTXXISWG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> > On Wed, Mar 06, 2024 at 09:34:14AM +0800, Zhang Yi wrote:
> > > Removed mic1-src and mic2-src. and changed default value
> > > of interrupt-clk
> >
> > We could do with a better changelog here.
> >
> > > - everest,mic1-src:
> > > - $ref: /schemas/types.yaml#/definitions/uint8
> > > - description:
> > > - the value of reg 2A when headset plugged.
> > > - minimum: 0x00
> > > - maximum: 0x77
> > > - default: 0x22
> > > -
> > > - everest,mic2-src:
> > > - $ref: /schemas/types.yaml#/definitions/uint8
> > > - description:
> > > - the value of reg 2A when headset unplugged.
> > > - minimum: 0x00
> > > - maximum: 0x77
> > > - default: 0x44
> >
> > This will make any DTs using the properties instantly buggy. I believe
> > there's a way of marking properties as deprecated, you should use that
> > instead. Or we could just leave the properties there and ignore them at
> > runtime.
> 'deprecated: true' is the way.

OK.I will modify the properties, thank you for your support
