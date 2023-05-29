Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC567143BD
	for <lists+alsa-devel@lfdr.de>; Mon, 29 May 2023 07:27:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 787C520C;
	Mon, 29 May 2023 07:26:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 787C520C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685338057;
	bh=yVoaOUXbOBC7CemKH4jxuLrA+Cy2P81i7fI7XtLeuiM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sUDoFmbc12irbnity7TtfnIJhCQVSVzaAG8Ik9pwyXeTPJquezYLdww8+0h1PRGlp
	 u+Ssyvhl+q+8VUllSlgs2/1EicoTdYpP+R/EzAZU6ETsyeW89qOJbl3ZEN4xqawlCY
	 JW4IANMM10j4J9X/R+20vGcawJJ2rzlb/ck59lys=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E15FAF80568; Mon, 29 May 2023 07:25:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 32D9AF8055C;
	Mon, 29 May 2023 07:25:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F727F8042F; Mon, 29 May 2023 07:20:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A6F98F8016B
	for <alsa-devel@alsa-project.org>; Mon, 29 May 2023 07:20:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6F98F8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sk9yj12N
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AC375611A3;
	Mon, 29 May 2023 05:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F9BEC433EF;
	Mon, 29 May 2023 05:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685337633;
	bh=yVoaOUXbOBC7CemKH4jxuLrA+Cy2P81i7fI7XtLeuiM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sk9yj12NbE3zSbxGD88YDiRMuvNeTIz4Fs0F1URoFBTromRWGA7tY567RHMgEpgcu
	 G+379bu3UpYFwAsxvgBf/II4WJLhKtneY1jKhWfES3LEyan8RK/q/x7G6YLngxa7nH
	 QZ+mphtIwdVQnL19TIHMtxN+w/GUV4vwejQ1X7aP6jSJJh/xcM5jQ8LKYpmzSjICci
	 WpryIn2E0eoiW3QU2PAtRjERWiUhc+0VIOmwYJuf91YBaC9AtP9PTID/ffJ5B7wEHU
	 UgHcJo3qjPyy5G9+IyNNXMLQR/2lpkZDIrsESZ03MVtXRRflpOohs6ok3Jh4d8+L3h
	 ybeZAVRsvVGRw==
Date: Mon, 29 May 2023 10:50:28 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	=?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] soundwire: qcom: fix unbalanced pm_runtime_put()
Message-ID: <ZHQ2HMflBM6rKMrw@matsya>
References: <20230517163750.997629-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230517163750.997629-1-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: DEMJ6HQSHPJB6L3XZAEL7BCPHFSFQGX4
X-Message-ID-Hash: DEMJ6HQSHPJB6L3XZAEL7BCPHFSFQGX4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DEMJ6HQSHPJB6L3XZAEL7BCPHFSFQGX4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 17-05-23, 18:37, Krzysztof Kozlowski wrote:
> This reverts commit 57ed510b0547 ("soundwire: qcom: use
> pm_runtime_resume_and_get()") which introduced unbalanced
> pm_runtime_put(), when device did not have runtime PM enabled.
> 
> If pm_runtime_resume_and_get() failed with -EACCES, the driver continued
> execution and finally called pm_runtime_put_autosuspend().  Since
> pm_runtime_resume_and_get() drops the usage counter on every error, this
> lead to double decrement of that counter visible in certain debugfs
> actions on unattached devices (still in reset state):

Applied, thanks

-- 
~Vinod
