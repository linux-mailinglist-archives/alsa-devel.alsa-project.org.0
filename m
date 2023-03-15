Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 174D16BB5B3
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 15:14:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF1F11263;
	Wed, 15 Mar 2023 15:14:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF1F11263
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678889692;
	bh=V2DqD28+RXNNjS2aAghs1Y8A/D9Ogfl49T6VIVzYeCo=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JMeSKEoVdpCDOyj6k488HmnL+uVL3SLPBZJUI3pgFtAkZPp+FfAW1l5eoSZdE9lr5
	 6dYs0HdKr1x1S9VqVhE4JI/I/iXCgEdbSAzB9jxbLvVslY31CtM0Qk9QdPpkjwEgQN
	 98DjXf86PUX5r6MWjYZNj1ukDlNujMu20ffeN0yc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AC72CF8032D;
	Wed, 15 Mar 2023 15:14:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB6E1F80423; Wed, 15 Mar 2023 15:13:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D1031F800C9
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 15:13:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1031F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=g4JKQ2lA
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5252BB81DFD;
	Wed, 15 Mar 2023 14:13:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B79EC433EF;
	Wed, 15 Mar 2023 14:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678889630;
	bh=V2DqD28+RXNNjS2aAghs1Y8A/D9Ogfl49T6VIVzYeCo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g4JKQ2lArhj5lU24BlQ/yJmiUZWxYbmoHE6CmLB7YIGMFck78npmWTUab94bFWHci
	 fjk6Uabk1XX+GUseY2gTB7acpc1FGpP8g6W8xVw/RFdjOfmS7OwgK3b2yc2tYG41f/
	 VIax0vgTBZImzLMZCankk12+tg2PnksSqJ+Ha+/nZ1jQrurnGceVnP9wJyK0ZrTaFu
	 P7RqlWNLVOWz89OpTiLqWWIENKaHJ8FwjcwWXb1d/bY9M9fGInbsnfdnrUPjbaK6Kp
	 C/GjoGuZqG5rN1nQbO0sfZ4t11FeE8/8r3VmAcyGBJ66jN58dHy7rQKCDuZlpW7LB2
	 2slgZjUvWhDBw==
Date: Wed, 15 Mar 2023 19:43:45 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] soundwire: qcom: define hardcoded version magic
 numbers
Message-ID: <ZBHSmb3TlR0Bv3o7@matsya>
References: <20230222144412.237832-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230222144412.237832-1-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: E2SENEEMDRSVAAZLYKGWE6NIV2JR7XCA
X-Message-ID-Hash: E2SENEEMDRSVAAZLYKGWE6NIV2JR7XCA
X-MailFrom: vkoul@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E2SENEEMDRSVAAZLYKGWE6NIV2JR7XCA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 22-02-23, 15:44, Krzysztof Kozlowski wrote:
> Use a define instead of hard-coded register values for Soundwire
> hardware version number, because it is a bit easier to read and allows
> to drop explaining comment.

Applied both, thanks

-- 
~Vinod
