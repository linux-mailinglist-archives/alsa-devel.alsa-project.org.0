Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EDB6FA11A
	for <lists+alsa-devel@lfdr.de>; Mon,  8 May 2023 09:33:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9700812AC;
	Mon,  8 May 2023 09:32:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9700812AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683531215;
	bh=uFm7amat6u5/NTy02eKQykrRvo7kkoqHKGb741TnEf8=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=olNm0pFUUVsXpx4iJOjJaBP3ppGqxFKBRDKjgEvGH0O8EymsMztocdmlMAi4z6Ujz
	 2hUc4aLItd2omUowPCN/2KI9XeNpcmPRa2veo4SeUeqTEnye6milMvZF/SXiU5tFaI
	 xL7vu7JhhvIY0Yy6Fvg8sf16qX2a/7Yb8rme4rK4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B19F5F80534;
	Mon,  8 May 2023 09:32:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BBBFF8053B; Mon,  8 May 2023 09:32:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 25239F8052E
	for <alsa-devel@alsa-project.org>; Mon,  8 May 2023 09:31:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25239F8052E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lddSyqHX
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AD4C461B63;
	Mon,  8 May 2023 07:31:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECFFBC433EF;
	Mon,  8 May 2023 07:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683531115;
	bh=uFm7amat6u5/NTy02eKQykrRvo7kkoqHKGb741TnEf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lddSyqHXQphaywKV2TuBbmDUA2mtJJfRsde3Rdqlk1ahvi9QnaIYW/jvcvFb0WzMs
	 qxYcKeHi/GrV9Xg303yXbvHIHpfwivcEdyOwW0xIxW+5q4tr3BAVx/NdNugxfpoS1g
	 32ngqaqWKokfjbxUMS4x3MUKsbBRM2bKzBmWiTitUDiZdxnKfmQQoVjuBav4uWnxaA
	 cX5mvj7h46dOMaRfDgz3s7j8Q9go6LOuXydgcGFp8MV0BhPs9wQW+fNH0B3RGG1lZ9
	 7cKvoyGQK8dHhe04ZQwAbuIyIPTLmd8s5jonU8UCQVdDFRogEVJSHthcCTaZ2mHZso
	 ADV0Nhx+C98Yw==
Date: Mon, 8 May 2023 13:01:51 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 0/7] soundwire: qcom: add support for SM8550
 (Soundwire v2.0.0)
Message-ID: <ZFilZ9MYdjmjtv0i@matsya>
References: <20230418095447.577001-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418095447.577001-1-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: IRUGOXBNDRBILLKGDGFPCVNHKI4PCA4X
X-Message-ID-Hash: IRUGOXBNDRBILLKGDGFPCVNHKI4PCA4X
X-MailFrom: vkoul@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rao Mandadapu <quic_srivasam@quicinc.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IRUGOXBNDRBILLKGDGFPCVNHKI4PCA4X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 18-04-23, 11:54, Krzysztof Kozlowski wrote:
> Hi,
> 
> Changes since v2:
> 1. Use uint16 for qcom,ports-sinterval.
>    DTS will be fixed in separate patchset.
> 2. Add tags.
> 
> Changes since v1:
> 1. Patch 1: Increase maxItems to 16 for port-related properties.
> 2. Re-order patch 1 and 2.
> 3. Patch 3: Drop unneeded semicolon.
> 4. Patch 5: Fix lang typo in subject.

Applied, thanks

-- 
~Vinod
