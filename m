Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF6CA4FA71
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Mar 2025 10:43:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F2F06044E;
	Wed,  5 Mar 2025 10:42:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F2F06044E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741167785;
	bh=WKL8FMSMGvnNlMcxUFJmjaZmbXHta4bdVva6X43xUHE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tFR1ivTxBOLV2fNVLQ1BeaFhxv5PxTaA7qvQ4WUsuMRV/rRGEhz2L6/ssMDue+Dwz
	 VaSqf1YxDpCYU/VpH1BiE89pmelYVc2GlaylI8A/cg4VrHdzv333EOEzWzWNixNuWy
	 QOFRya5GB1yPsSzZ/9ry9PMaasNHwtUeoCX3IAqk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21C79F806BA; Wed,  5 Mar 2025 10:38:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6520F896CC;
	Wed,  5 Mar 2025 10:38:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCD6DF802BE; Wed,  5 Mar 2025 09:13:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp134-84.sina.com.cn (smtp134-84.sina.com.cn
 [180.149.134.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6213BF8011B
	for <alsa-devel@alsa-project.org>; Wed,  5 Mar 2025 09:13:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6213BF8011B
Received: from unknown (HELO
 zy-virtual-machine.localdomain)([180.159.108.137])
	by sina.net (10.185.250.29) with ESMTP
	id 67C8079800007499; Wed, 5 Mar 2025 16:13:13 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 931F00EF7C0A4302A6C8BAFB9EC541E1
X-SMAIL-UIID: 931F00EF7C0A4302A6C8BAFB9EC541E1-20250305-161313
From: Zhang Yi <zhangyi@everest-semi.com>
To: krzysztof.kozlowski+dt@linaro.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	robh+dt@kernel.org,
	conor+dt@kernel.org,
	alsa-devel@alsa-project.org,
	broonie@kernel.org,
	devicetree@vger.kernel.org
Subject: RE: [PATCH v3 2/2] ASoC: dt-bindings: Add Everest ES8389 audio CODEC
Date: Wed,  5 Mar 2025 16:13:11 +0800
Message-Id: <20250305081311.86552-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: CIEQGDVKCKRLMUT4BDBZAKAZZAAY7V6M
X-Message-ID-Hash: CIEQGDVKCKRLMUT4BDBZAKAZZAAY7V6M
X-Mailman-Approved-At: Wed, 05 Mar 2025 09:38:15 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CIEQGDVKCKRLMUT4BDBZAKAZZAAY7V6M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> > 
> >>> +
> >>> +  prefix_name:
> >>
> >> No underscores in node names, missing vendor prefix... but more
> >> important:  I don't understand the need for this property. Description copies property name so it is not useful.
> 
> And these comments as well.

The prefix_name is used to distinguish the dapm and kcontrol of each individual codec.
And I will update name of the property 

> > 
> >>> +  everest,dmic-enabled:
> >>> +    $ref: /schemas/types.yaml#/definitions/flag
> >>> +    description:
> >>> +      The property is a choice between PDM and AMIC
> >>> +
> >>
> >> No supplies?
> > 
> > I will drop the property
> 
> I did not comment about dmic, but meant missing power supplies, which
> usually are placed here.

I apologize for misunderstanding your comment.
But we don't have properties about the power supplies
