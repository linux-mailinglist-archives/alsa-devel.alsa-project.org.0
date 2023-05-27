Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB18713420
	for <lists+alsa-devel@lfdr.de>; Sat, 27 May 2023 12:42:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD097826;
	Sat, 27 May 2023 12:41:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD097826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685184165;
	bh=uTfcgi+lhkriPaXy2kU439QU60IlPz9ZzUpA1gh+Li4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hfJ6Oo+cZLs4xPFObWReNV37uNsgWL7VYeqvKInQSQyZ4Gw+9DGwU+s21IVj9abvW
	 g7l8xoSsByBa7pntc0SK3b3Y6I5AhzB4utCjurYXT/DK/7Syv2AVdzYbkLL/26i6kx
	 Kesl47NB6JkUmSww9ycVx4RNcgOq4OvVM2CzqSH8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7BDCF8057A; Sat, 27 May 2023 12:41:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 31B14F8057A;
	Sat, 27 May 2023 12:41:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F7FFF8057B; Sat, 27 May 2023 12:40:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 44202F80567
	for <alsa-devel@alsa-project.org>; Sat, 27 May 2023 12:40:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44202F80567
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WxZdPIGV
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 254C461BA3;
	Sat, 27 May 2023 10:40:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F8C6C433EF;
	Sat, 27 May 2023 10:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685184052;
	bh=uTfcgi+lhkriPaXy2kU439QU60IlPz9ZzUpA1gh+Li4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WxZdPIGVAWhALQGmiG9+jgxdfOOKkje5eZjF9o/rk60AF19aSguj+h9UTDXzhGpcQ
	 e4J0kwdQuwgEzbp/PVcD5rMYzA6MbxlP1yPBcenM2Iik68XOcizaJmQ3G1uzB3t7BC
	 GGr9xhNt/kqXYjHUC9K7rRlmluB9fOfjM1xOopbMlqgSweNG7Dwr75MOc8MlJR9uB/
	 CXpUTJ73KJuNFuSXG8Lrjd8n3Mlrw52ZuK+F64BgR/5lYmC9FxlzKBFXyxOt96k2wj
	 E1T5/ywzITNQqM372SjAvquJUf3+PoYQMsY3GbeOExN1HzPIfXkj66Iy3UAKHrxE88
	 wAO3Pq4PFkZ2A==
Date: Sat, 27 May 2023 16:10:48 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soundwire: qcom: add proper error paths in
 qcom_swrm_startup()
Message-ID: <ZHHeMGzeqQlNnc3x@matsya>
References: <20230517163736.997553-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230517163736.997553-1-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: YSVJGN4LAMMVWTAWM7QH27AA73DV7XT5
X-Message-ID-Hash: YSVJGN4LAMMVWTAWM7QH27AA73DV7XT5
X-MailFrom: vkoul@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YSVJGN4LAMMVWTAWM7QH27AA73DV7XT5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 17-05-23, 18:37, Krzysztof Kozlowski wrote:
> Reverse actions in qcom_swrm_startup() error paths to avoid leaking
> stream memory and keeping runtime PM unbalanced.

Applied, thanks

-- 
~Vinod
