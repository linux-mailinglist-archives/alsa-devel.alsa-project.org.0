Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D4CA4FA6E
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Mar 2025 10:42:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2204460436;
	Wed,  5 Mar 2025 10:42:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2204460436
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741167767;
	bh=RUHAQ0IAj4zC/gRQ1ipF4hh2/5ZA+MCebufmX5tubNQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=afS+CJaI6IJxuXxB/LpPpBqxz4CvYscu7qBuT8rFCrbglPUKn4yEVfIEqVs/YBYg5
	 jfJ+Vt5Hlox6cKK/BwBqcIS/x/QKVi/fv1JeSL+S3+4sXop/vtOJZgwJBxuJ5NuSxt
	 egoNXbpC/Fr343dcpBJ9HwlU/5PQAhL2Er6FfZrg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD7DEF806A3; Wed,  5 Mar 2025 10:38:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87C69F805C2;
	Wed,  5 Mar 2025 10:38:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49D60F802BE; Wed,  5 Mar 2025 08:11:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail78-66.sinamail.sina.com.cn (mail78-66.sinamail.sina.com.cn
 [219.142.78.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6D640F8001D
	for <alsa-devel@alsa-project.org>; Wed,  5 Mar 2025 08:10:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D640F8001D
Received: from unknown (HELO
 zy-virtual-machine.localdomain)([180.159.108.137])
	by sina.net (10.185.250.32) with ESMTP
	id 67C7F8FA000079B4; Wed, 5 Mar 2025 15:10:51 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 6B0B3AE3CA3B4F78998DCD2B2CD2AC50
X-SMAIL-UIID: 6B0B3AE3CA3B4F78998DCD2B2CD2AC50-20250305-151051
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
Date: Wed,  5 Mar 2025 15:10:50 +0800
Message-Id: <20250305071050.113541-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 3ZYZQP2N46NJUDE7MYNLEEAVCPOZP5YM
X-Message-ID-Hash: 3ZYZQP2N46NJUDE7MYNLEEAVCPOZP5YM
X-Mailman-Approved-At: Wed, 05 Mar 2025 09:37:13 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3ZYZQP2N46NJUDE7MYNLEEAVCPOZP5YM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> > +
> > +properties:
> > +  compatible:
> > +    const: everest,es8389
> 
> Device is really different than es8388?

yes, it's different from es8388

> > +  "#sound-dai-cells":
> > +    const: 0
> > +
> > +  everest,adc-slot:
> > +    $ref: /schemas/types.yaml#/definitions/uint8
> > +    description: |
> > +      This property is used to set the slots of recording data when multiple
> > +      codecs are connected in PTDM mode.
> > +      please set this property to default if you are setting STDM mode.
> > +    minimum: 0x00
> 
> Drop, unsigned does not allow -1.
> 
> > +    maximum: 0x07
> > +    default: 0x00
> 
> All of these should be rather decimal.

I will try to fix the error

> > +
> > +  prefix_name:
> 
> No underscores in node names, missing vendor prefix... but more
> important:  I don't understand the need for this property. Description copies property name so it is not useful.
> 
> Drop. You maybe wanted dai prefix, but this is already in dai-common.

I will update description at v4 PATCH

> > +  everest,dmic-enabled:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description:
> > +      The property is a choice between PDM and AMIC
> > +
> 
> No supplies?

I will drop the property

> > +required:
> > +  - compatible
> > +  - reg
> > +  - "#sound-dai-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c{
> 
> Missing space.
> 
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +      es8389: es8389@10 {
> 
> Node names should be generic. See also an explanation and list of examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> 
> > +        compatible = "everest,es8389";
> > +        reg = <0x10>;
> > +        everest,adc-slot = [00];
> 
> Please open other bindings or DTS and take a look how single number is encoded. In general, please rather base your work on latest bindings and DTS accepted by reviewers and use them as learning/template to avoid common mistakes. At least two comments in this review could be avoided if you did this.
> 
> > +        everest,dac-slot = [00];
> > +        prefix_name = "es8389_0";
> 
> Drop

I will try to fix it
