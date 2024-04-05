Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F64899C25
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Apr 2024 13:55:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A62FA2D0B;
	Fri,  5 Apr 2024 13:55:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A62FA2D0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712318110;
	bh=xtWDTgQnqWwlGt4hSK509dlzyI5ov0XFlUekFt9Elt4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m7rnjIBszOowQ+6XFsRFn3KZMP3X1eS4tLqJjQfEnpOL6TQPKmI10oToTxoYWP3u5
	 XKSTcYZ5dwhOWW/+AJuM/ZZNhgE4AdGQzROWW8ENau/dppZo2Ml1jXsPujS7dqIWBY
	 qkYcUXLo8hnxI4RpLB0X40IUNMOfTgRN1Yf1l6ug=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED5E6F80579; Fri,  5 Apr 2024 13:54:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C985F80587;
	Fri,  5 Apr 2024 13:54:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7660F8020D; Fri,  5 Apr 2024 13:54:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 70630F80007
	for <alsa-devel@alsa-project.org>; Fri,  5 Apr 2024 13:54:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70630F80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LCJdQ2M8
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B8AB0CE2406;
	Fri,  5 Apr 2024 11:54:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E741C433F1;
	Fri,  5 Apr 2024 11:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712318063;
	bh=xtWDTgQnqWwlGt4hSK509dlzyI5ov0XFlUekFt9Elt4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LCJdQ2M8SudtctJXICiqEHb5IW5cnvqyV8c2DgU/C3Jb0sDEtWhdj2JCUPlhLgjCY
	 HbfBMDYfXvCJTWsP3yzz6cKHc3uxyZyeflmjb2f/Ra0Mi6j4kh/J8q2XpzafXXlbYs
	 lGHCzLlb51yurcbLyacoBP/nW05DysT8gpH1o3IJiTrB0tfxVTzcUJdWHlrTIGpL9d
	 zCspJvFYsiq4ZSuBxF8m9I8Y5Kg2z1I8EFKaxzk5JxzkRAfwFsN7DlGeJVmaeAziy8
	 tp+CnEtUtjF0gbTsGmVzQM42blDR4wehkLTGLoTy2glcFfSSNdsr2MEm//6hYPsZ7r
	 +A2R5gx9VlNPA==
Date: Fri, 5 Apr 2024 17:24:18 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH RESEND] soundwire: qcom: allow multi-link on newer devices
Message-ID: <Zg_maukMaZXuJAWR@matsya>
References: <20240403132716.325880-1-krzysztof.kozlowski@linaro.org>
 <Zg_fvU-SA9nwmzW8@matsya>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zg_fvU-SA9nwmzW8@matsya>
Message-ID-Hash: ZIOOUBLWV3IASM7J6RD5P6XLZJYRFVOI
X-Message-ID-Hash: ZIOOUBLWV3IASM7J6RD5P6XLZJYRFVOI
X-MailFrom: vkoul@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZIOOUBLWV3IASM7J6RD5P6XLZJYRFVOI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 05-04-24, 16:55, Vinod Koul wrote:
> On 03-04-24, 15:27, Krzysztof Kozlowski wrote:
> > Newer Qualcomm SoCs like X1E80100 might come with four speakers spread
> > over two Soundwire controllers, thus they need a multi-link Soundwire
> > stream runtime.
> 
> This does on apply on sdw/next.

s/does/does not

> 
> Pls rebase
> 
> -- 
> ~Vinod

-- 
~Vinod
