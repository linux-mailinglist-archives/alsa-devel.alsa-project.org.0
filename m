Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50508602257
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 05:15:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECB719365;
	Tue, 18 Oct 2022 05:14:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECB719365
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666062940;
	bh=KUiKr47b0U7BG8MHMA6x9yTYT7DWpF6dS63ARtGfCF0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kGZ/qJFXKWfvAcxmJFUMaxDqqpNy0t3H4rpRkLyZzNIzA8eRP6SuTNGpNTNiMkNv4
	 fX4AeqnCFFvLrXcPJyNFefuuAMUQeR6ism51y22TRK35TLXMHdqgaAFyLrVvBX0Z9k
	 /Bw9ZpZ+9LOHU3AqS3ggYouLVJdqrvLVe2DLqaxg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E0B0F804BD;
	Tue, 18 Oct 2022 05:14:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98CCEF8024C; Tue, 18 Oct 2022 05:14:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A44ABF800AB
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 05:14:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A44ABF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="H7jsiAFb"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 30F7861405;
 Tue, 18 Oct 2022 03:14:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76590C43141;
 Tue, 18 Oct 2022 03:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666062878;
 bh=KUiKr47b0U7BG8MHMA6x9yTYT7DWpF6dS63ARtGfCF0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H7jsiAFbzP4JuXJyZqurlXGzTQ0FqvwY2WdeRdacspPbGEcg8kV4gn19U9akH08lR
 Ej8kikb0MoYThUOzVaIEW2TQmLqqpXb8NzW64G1ggOlQ8NLC2JEtxM6osfiG8PlWRD
 An27KT5zll6ZfSjupHvU0Z/qvUQ5QFOU6OlcFk/0Av6PGAm8SxkGLWOJkvMzOd7H0W
 tM+invoJZw7rB6sPimsL8GibmCb/SC96gz+BiTowqEZjBLKAFbOndKlbeOdJNB4D2T
 qS42Ld/ax78q7V/OkiT3HuGrQl87Rk5F6uhCTyPebOsAQ9j4fWE76mL1+cGkFeP3uf
 1Y0NduoqX4XWQ==
From: Bjorn Andersson <andersson@kernel.org>
To: pabeni@redhat.com, kuba@kernel.org, kvalo@kernel.org,
 mathieu.poirier@linaro.org, elder@kernel.org, quic_jjohnson@quicinc.com,
 edumazet@google.com, srinivas.kandagatla@linaro.org, davem@davemloft.net,
 agross@kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH v2 0/4] Make QMI message rules const
Date: Mon, 17 Oct 2022 22:14:29 -0500
Message-Id: <166606235855.3553294.15415652032581758108.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220914234705.28405-1-quic_jjohnson@quicinc.com>
References: <20220912232526.27427-1-quic_jjohnson@quicinc.com>
 <20220914234705.28405-1-quic_jjohnson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
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
      (no commit info)
[3/4] slimbus: qcom-ngd-ctrl: Make QMI message rules const
      (no commit info)
[4/4] soc: qcom: pdr: Make QMI message rules const
      commit: afc7b849ebcf063ca84a79c749d4996a8781fc55

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
