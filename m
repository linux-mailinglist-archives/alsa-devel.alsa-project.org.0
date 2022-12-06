Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB312644B73
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Dec 2022 19:22:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50EE5186C;
	Tue,  6 Dec 2022 19:21:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50EE5186C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670350924;
	bh=u9K3e0WsxTmn1FoVe5DXR4Sa042HRgCOKULMLvQUOHI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EQAN1gM4o8Uam6kNIa5jdl6iXIoeDAtYYbgJrPRm78qHT2nh9jpK2YgaRkQkyZq7v
	 af2qgFfwV1wgZIeldK4fH1CCliskRXX983giBzCe05lUZhOsGVOGDKMaHjIv++UfsO
	 DqQx4m7N6sB+0+9xuNPoAYCRm9ui/y4lVATwaEsI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1CBCF80559;
	Tue,  6 Dec 2022 19:20:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD8C2F802DB; Tue,  6 Dec 2022 19:20:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB574F802DB
 for <alsa-devel@alsa-project.org>; Tue,  6 Dec 2022 19:20:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB574F802DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SSOTIDrA"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 67D9C61856;
 Tue,  6 Dec 2022 18:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8B08C43150;
 Tue,  6 Dec 2022 18:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670350827;
 bh=u9K3e0WsxTmn1FoVe5DXR4Sa042HRgCOKULMLvQUOHI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=SSOTIDrAn1VQM1uuWEuY/oOS8tqBlUcymKK6Bi0sO5IX04oHlHj+OfvjzTIv6/lG6
 eWEQxn5MyPQP4kZ3QQ7hF4EzEefkg2GYDUl20eiJtcxTYVtnJFrN7cZM6j4YHoF7T2
 ONfRAKYaQqnfJXO6IajCLttmZgYzH8Bhx1Wrtw4gftn4Ny35dYkKSagmwsvHabMhlX
 5+xi0EuocM5kN1IB3EfSoFvW6Fb6AVcWylvte/TOH5n6dHPZw4CRsYDn5U31jj/n//
 ZPCu1Quu0EjDahDGSaWK+hdg+nChbDuS7AbPnriLsCQE2zKWc4XZgxQUPz+nnKP2mv
 ynxi6EjA7/J6Q==
From: Bjorn Andersson <andersson@kernel.org>
To: robh+dt@kernel.org, konrad.dybcio@somainline.org,
 quic_srivasam@quicinc.com, dianders@chromium.org,
 krzysztof.kozlowski+dt@linaro.org, broonie@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 swboyd@chromium.org, quic_rjendra@quicinc.com, mka@chromium.org,
 devicetree@vger.kernel.org, srinivas.kandagatla@linaro.org,
 vkoul@kernel.org, judyhsiao@chromium.org, agross@kernel.org,
 quic_rohkumar@quicinc.com, alsa-devel@alsa-project.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Remove unused sleep pin
 control nodes
Date: Tue,  6 Dec 2022 12:19:31 -0600
Message-Id: <167035076336.3155086.4193158325471887887.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <1668591184-21099-1-git-send-email-quic_srivasam@quicinc.com>
References: <1668591184-21099-1-git-send-email-quic_srivasam@quicinc.com>
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

On Wed, 16 Nov 2022 15:03:04 +0530, Srinivasa Rao Mandadapu wrote:
> Remove unused and redundant sleep pin control entries as they are
> not referenced anywhere in sc7280 based platform's device tree variants.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sc7280: Remove unused sleep pin control nodes
      commit: 7fa58dc94dd274c27cf1ab54b37d2dd54d7e18ac

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
