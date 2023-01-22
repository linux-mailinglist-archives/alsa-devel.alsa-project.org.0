Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6939676C4B
	for <lists+alsa-devel@lfdr.de>; Sun, 22 Jan 2023 12:22:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DD2141F6;
	Sun, 22 Jan 2023 12:21:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DD2141F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674386547;
	bh=hhL4owlHSb7bTGGL4JOXpwJorCM1k6EPqpOeVcz6xuk=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G7LifhEoTSDZSSfwpqHX87uzkjXITqNKG+ynIoVTrh03bhDytqnTOYI07Lf3c3sbW
	 sevdLRx4Syo6UXl6ab3XcWvgneoqTlcff1HpA8MjI5GiF1Z6KwIt8QnUQ8FsBpQO3X
	 lH3hAbA8P7wjPgQOk74HZJz6G6PRzapx2kVwLZ/c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2B1AF801D5;
	Sun, 22 Jan 2023 12:21:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7229EF8027D; Sun, 22 Jan 2023 12:21:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46582F80254
 for <alsa-devel@alsa-project.org>; Sun, 22 Jan 2023 12:21:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46582F80254
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kSrwphvo
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A49D060BA5;
 Sun, 22 Jan 2023 11:21:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6408C433D2;
 Sun, 22 Jan 2023 11:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674386475;
 bh=hhL4owlHSb7bTGGL4JOXpwJorCM1k6EPqpOeVcz6xuk=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=kSrwphvoMzmfojC0Gr5hBMhrk/Zt+5W3hSe8664nYNogg1GCoZVD4xPRJppoVa1Wn
 giClbBm0b9FuwiPRAOK61GYWmnIdWYjw8443ol25fz1kSYhL66Ui00xscNYfyLKlt5
 cXd+w27p0pQyErVDTAfOptz9kCjBJK4RaeS2syg/AX6UoJUjq1K0PVWw9oBpzffINi
 pk5ghYXJzqxqRNy3vpAEmizr5+YvBZqCw6oyunbbqj3oa3KYOGW3ou5P+0WIbQcVBs
 tDz96oDRoyHkmprvuj+/fCbXsuXE86mUb60o2eRc6AOr0iL5h02Z4hn11QL1zVH4c8
 lxZcSitMEm3QQ==
Message-ID: <bbb4f42a-28a1-e54d-28d2-1c3c23fc9074@kernel.org>
Date: Sun, 22 Jan 2023 12:21:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 1/2] ASoC: qcom: dt-bindings: lpass-va-macro: Update
 clock name
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org,
 andersson@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, quic_plai@quicinc.com, bgoswami@quicinc.com,
 srinivas.kandagatla@linaro.org, quic_rohkumar@quicinc.com,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, swboyd@chromium.org, judyhsiao@chromium.org,
 devicetree@vger.kernel.org, konrad.dybcio@linaro.org
References: <1674210685-19944-1-git-send-email-quic_srivasam@quicinc.com>
 <1674210685-19944-2-git-send-email-quic_srivasam@quicinc.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <1674210685-19944-2-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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


Subject prefix: ASoC: dt-bindings: qcom,lpass-va-macro:
(you got such comment few days ago)

On 20/01/2023 11:31, Srinivasa Rao Mandadapu wrote:
> Update clock name from core to macro in lpass-va-macro node
> to make it compatible with existing driver and device tree node.

s/device tree node/existing DTS files/

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

> 
> Fixes: 67d99b23c881 ("ASoC: qcom: dt-bindings: add bindings for lpass va macro codec")
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

You also got this comment last time... so I don't know what to do more
here...

Best regards,
Krzysztof

