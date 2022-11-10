Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 905F1623AE3
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 05:10:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18BCF1636;
	Thu, 10 Nov 2022 05:09:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18BCF1636
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668053426;
	bh=81lSIlfnbBdiRPpJNDMzG8ycVnvzAqMfAXrNG856iJ4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CJVuMp2u6XMMK+y9Yo4hOEWd/3r5yAUk9i2+bhv0XhDnkzinG+JffP5LkFYDQuIXc
	 /5ZEOT2GTYxzYzjhs1iwlDygo2gdZO3vjVKiGidPTFMZ5UGsMwD6HPnszxrHPty2KR
	 9vsUc9XBN/RzgSwnnikdx6ogmiOwZ2R5cGl1xh3Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B6C5F8021D;
	Thu, 10 Nov 2022 05:09:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 548D8F80162; Thu, 10 Nov 2022 05:09:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A29C2F80162
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 05:09:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A29C2F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="StnQH+n2"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id F3DF2CE214B;
 Thu, 10 Nov 2022 04:09:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D60EC43470;
 Thu, 10 Nov 2022 04:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668053359;
 bh=81lSIlfnbBdiRPpJNDMzG8ycVnvzAqMfAXrNG856iJ4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=StnQH+n2430+Bem/9YzRlTlh+6vkhRxNmrPJTakkYrKlzjQDJQhVu07vkdoTB1H/M
 0Wg6C7gCm9GBtMrSe7x4f6zOA/I+/e5iQAE5JbR2E/qVZL2/GOE9qA1dQOEjm6qURx
 Vc3oxvkIXJEKc7mTaa4qHmhikhgZLunlhlcamtniJXJmHko1rgwhKQ+Zf5IzfCrnAK
 5+kBCNC/KARlNE49LJSpwBpAbpbKCsVq+ryAYbffpCnEjMnELju5ds3qVZJu8TlvsJ
 H9tk0TROADX867Cm9IjY816WBHd6kekY5kWziX0upBIEMqnC4L9YuM/XvMVz1P/esv
 FulPI4ZbmzidA==
From: Bjorn Andersson <andersson@kernel.org>
To: agross@kernel.org, konrad.dybcio@somainline.org, robh+dt@kernel.org,
 quic_rjendra@quicinc.com, dianders@chromium.org, swboyd@chromium.org,
 srinivas.kandagatla@linaro.org, devicetree@vger.kernel.org,
 vkoul@kernel.org, quic_rohkumar@quicinc.com,
 krzysztof.kozlowski+dt@linaro.org, quic_srivasam@quicinc.com,
 mka@chromium.org, judyhsiao@chromium.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 alsa-devel@alsa-project.org
Subject: Re: (subset) [PATCH v6 0/4] Convert soundwire bindings to DT schema
Date: Wed,  9 Nov 2022 22:09:11 -0600
Message-Id: <166805334842.800572.16401396604947075257.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <1667918763-32445-1-git-send-email-quic_srivasam@quicinc.com>
References: <1667918763-32445-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 8 Nov 2022 20:15:59 +0530, Srinivasa Rao Mandadapu wrote:
> Convert soundwire bindings text file to DT schema and update
> device tree entries to follow strict dt-bindings.
> Changes since V5:
>   -- Update indentation of few properties description.
>   -- Update minimum and maximum limit for few properties.
>   -- Fix Typo errors in commit message.
>   -- Update commit message with differences from text file.
> Changes Since V4:
>   -- Update interrupt names in example.
>   -- Fix blank lines.
>   -- Remove dependecy patch info.
>   -- Split dtsi patches as per SoC.
> Changes Since V3:
>   -- Remove subnode description and add appropriate pattern properties.
>   -- Add interrput names in example.
>   -- update some properties description.
>   -- Revert minIteams change in previous version.
>   -- Rebase to latest code base.
>   -- Update dtsi node names,
>   -- Remove redundant property in soundwire node.
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: Update soundwire secondary node names
      commit: bd35f4b0179692cacc8cd80aece56012b3b36c69
[2/4] arm64: dts: qcom: sm8250: Remove redundant soundwire property
      commit: 837f597ebc529b2dce6451da27f24d93ebe194c8
[3/4] arm64: dts: qcom: sc7280: Remove redundant soundwire property
      commit: 78043031281bbb31f89b66128982f404bcde94e8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
