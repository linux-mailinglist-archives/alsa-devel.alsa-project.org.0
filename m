Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC2B645E28
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Dec 2022 16:54:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA4B717F8;
	Wed,  7 Dec 2022 16:53:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA4B717F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670428478;
	bh=7RkxkZPydmgY+dUiToX4cyTrMbv8PtEIFaaPH+OJyTw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Aaj9TTEyEDUWJIvV8gBG9RoLazCWmD/oSWX+Gcz/hU/44m3KE0ReKfWITde4yeMue
	 wM/9uORKUvm7zWkMcl1gwYfQSQXeAf/ZicPVTzKtw4F883oPy1jEuecVlKhOVmzuUT
	 SDJhu3vJ4IECC2D2klbTwHJAZmrt7XPY9m+BNdWI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57498F80301;
	Wed,  7 Dec 2022 16:53:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 085E0F802BE; Wed,  7 Dec 2022 16:53:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A546FF80121
 for <alsa-devel@alsa-project.org>; Wed,  7 Dec 2022 16:53:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A546FF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZUIDnibX"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1A753B81EE8;
 Wed,  7 Dec 2022 15:53:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB84EC433C1;
 Wed,  7 Dec 2022 15:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670428413;
 bh=7RkxkZPydmgY+dUiToX4cyTrMbv8PtEIFaaPH+OJyTw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZUIDnibXsEXYoil1UjplZDSbfOPyvQ/M/UUun9HG+gHEHwIThD7mzfhP22CT6r5/h
 AQmWvJ3hmTVfm1YF6y4X3KirTz5pkTwXyOtC00Nxf/EVe0Iotwev4sMI0PYnMVTBPo
 QalrKnOI7AxjWiHUtZ5nxblvTuAFNx83GzLx6ibFSaqL9vsUjoCZNMJpbRZy2k8kam
 eR0wrngFG16fM0bNDOFMPivuYqk9IYuFkuEcHFqYwmQ31/mg2dDGMNUIm49NvX0kwI
 7AtoMCDigza+HDFjwViZEploqAZdYZwsQZyvhCAixAZFswwHL7/tfCC4XvHBWbKFj4
 2RQdtFhOH67dQ==
From: Bjorn Andersson <andersson@kernel.org>
To: srinivas.kandagatla@linaro.org, kuba@kernel.org,
 konrad.dybcio@somainline.org, elder@kernel.org, kvalo@kernel.org,
 edumazet@google.com, quic_jjohnson@quicinc.com, mathieu.poirier@linaro.org,
 davem@davemloft.net, agross@kernel.org, pabeni@redhat.com
Subject: Re: [PATCH v2 0/4] Make QMI message rules const
Date: Wed,  7 Dec 2022 09:53:26 -0600
Message-Id: <167042840342.3235426.4288324926729574883.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220914234705.28405-1-quic_jjohnson@quicinc.com>
References: <20220912232526.27427-1-quic_jjohnson@quicinc.com>
 <20220914234705.28405-1-quic_jjohnson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: netdev@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
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

On Wed, 14 Sep 2022 16:47:01 -0700, Jeff Johnson wrote:
> Commit ff6d365898d4 ("soc: qcom: qmi: use const for struct
> qmi_elem_info") allows QMI message encoding/decoding rules to be
> const. So now update the definitions in the various clients to take
> advantage of this. Patches for ath10k and ath11k were previously sent
> separately.
> 
> This series depends upon:
> https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?h=for-next&id=ff6d365898d4d31bd557954c7fc53f38977b491c
> 
> [...]

Applied, thanks!

[1/4] net: ipa: Make QMI message rules const
      (no commit info)
[2/4] remoteproc: sysmon: Make QMI message rules const
      commit: 7bd156cbbd0add4b869a7d997d057b76c329f4e5
[3/4] slimbus: qcom-ngd-ctrl: Make QMI message rules const
      (no commit info)
[4/4] soc: qcom: pdr: Make QMI message rules const
      (no commit info)

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
