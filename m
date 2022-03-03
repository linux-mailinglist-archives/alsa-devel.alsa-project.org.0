Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D73F34CC206
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Mar 2022 16:57:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 671CC1A75;
	Thu,  3 Mar 2022 16:56:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 671CC1A75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646323028;
	bh=InC9xaVPcWhBcn1swTSH2FFWicOR2y5qBtTa3QQr7uw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mIlQDiXMpEXqwovxCcPfHycvHembV1ElZ02zv7nz1eDYnzGQBo3kX0/fUChWkdbir
	 InG6Qn7yXey7l0sokwLsQ+kX4NCOb/E7Uncfp9TLr4+Iw7mJ+rKTfUXB2LVNVOhX4N
	 mPzS8Z2JGvbRWGeQJRvUk1OkiQshxBx+IH2ImUsE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C996CF80166;
	Thu,  3 Mar 2022 16:55:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40BDBF80152; Thu,  3 Mar 2022 16:55:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C3C2F8013D
 for <alsa-devel@alsa-project.org>; Thu,  3 Mar 2022 16:55:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C3C2F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hClBiL+L"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 45A3CB82624;
 Thu,  3 Mar 2022 15:55:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C8E0C004E1;
 Thu,  3 Mar 2022 15:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646322954;
 bh=InC9xaVPcWhBcn1swTSH2FFWicOR2y5qBtTa3QQr7uw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hClBiL+Ltur/DgONFRhoVM3OfVvvCPyF0ICITY2WNLgTqvYz96QZ6lVWz+Qo99kbG
 u7hwyD/HcYK2ECx77U6JkCFttjTzZZShwyz/YRtDNYRdYz2nP6NgzupPw8HN6T4CJn
 SaJI4UjmXESWPF9LcPHF9XJixKu3qRZu7fx1OsAnhHJGjmERghjOHQnspL8RqnK/KO
 wKxpVwIm5omY6VxwXyfgwefu3ReEvBJTTMa1G3+SqLywkHHpbMYNn5PGLQoyyF+RAE
 I8ccgP3K7he+0RNDH2WrSBP9r9U3ryTKHCdeweHbjZ2OUKf4m+V8wE7QbLnVkPvfte
 oVbWJ5K7mTm8g==
Date: Thu, 3 Mar 2022 21:25:49 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] soundwire: qcom: fix build failures if CONFIG_PM=n
Message-ID: <YiDlBevX3/BrXmwb@matsya>
References: <20220303110321.23666-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220303110321.23666-1-srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Stephen Rothwell <sfr@canb.auug.org.au>, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 yung-chuan.liao@linux.intel.com, quic_srivasam@quicinc.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 03-03-22, 11:03, Srinivas Kandagatla wrote:
> Fix below build failure
> drivers/soundwire/qcom.c:1460:12: error: 'swrm_runtime_resume' defined
> but not used [-Werror=unused-function]
> by marking the resume swrm_runtime_resume() with  __maybe_unused attribute.

A patch title should reflect the change and not the cause. So i have
taken liberty to fix it as:

soundwire: qcom: use __maybe_unused for swrm_runtime_resume() 
 
swrm_runtime_resume() would not be defined when CONFIG_PM=n
 
This causes below build failure
drivers/soundwire/qcom.c:1460:12: error: 'swrm_runtime_resume' defined
but not used [-Werror=unused-function]
 
Mark the resume swrm_runtime_resume() with  __maybe_unused attribute.

With this i have applied

-- 
~Vinod
