Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D337C9934
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Oct 2023 15:44:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7366A868;
	Sun, 15 Oct 2023 15:43:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7366A868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697377483;
	bh=+4YoH1QFIVI3P+xT+ytVMPTZTLwuk4rucPpWirZR76o=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Pqb7cS3fc5GmOOPFwLhnmnhVMO6FBddFeWxuZNngcKjEdzRN2qn/y4Hqm7DMiwy91
	 mnxsAhxirQnSQ+3P42g1FiIQt58r+05CN0bBry5yq732uQhcwNhO1rGWtxaQLEoTuE
	 Ci+/2lz+j3TAR/hqhB4tFPF5UGdrMiDiMT5dgEDI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A09EAF8024E; Sun, 15 Oct 2023 15:43:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 13334F8024E;
	Sun, 15 Oct 2023 15:43:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BC5EF80536; Sat, 14 Oct 2023 19:29:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CC369F80130
	for <alsa-devel@alsa-project.org>; Sat, 14 Oct 2023 19:28:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC369F80130
Received: from srv01.abscue.de (localhost [127.0.0.1])
	by spamfilter.srv.local (Postfix) with ESMTP id 265CB1C0729;
	Sat, 14 Oct 2023 19:28:51 +0200 (CEST)
Received: from fluffy-mammal.fritz.box
 (dslb-088-078-204-065.088.078.pools.vodafone-ip.de [88.78.204.65])
	by srv01.abscue.de (Postfix) with ESMTPSA id C34E91C0728;
	Sat, 14 Oct 2023 19:28:50 +0200 (CEST)
From: =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
To: linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org,
	~postmarketos/upstreaming@lists.sr.ht,
	=?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Subject: [PATCH 0/3] ASoC: qcom: check ADSP version when setting clocks
Date: Sat, 14 Oct 2023 19:26:21 +0200
Message-Id: <20231014172624.75301-1-otto.pflueger@abscue.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: otto.pflueger@abscue.de
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DXHX3U4575OQQHWFZOYQP3R246UK4XZP
X-Message-ID-Hash: DXHX3U4575OQQHWFZOYQP3R246UK4XZP
X-Mailman-Approved-At: Sun, 15 Oct 2023 13:43:25 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DXHX3U4575OQQHWFZOYQP3R246UK4XZP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The apq8016_sbc driver currently works on APQ8016 and MSM8916 devices. It
should also work on MSM8909 (and newer SoCs like MSM8917 and MSM8953 if
the quinary MI2S line is added); however, newer devices with these SoCs
ship with newer firmware that uses a different interface for controlling
the digital codec and bit clocks, which causes the driver to fail because
it cannot set LPAIF_BIT_CLK.

In order to fix this problem, modify the LPAIF_* clock implementation in
the qdsp6 driver to use the newer clock API if a newer firmware version is
detected. This seems to be a better solution than exposing the firmware
version to other drivers like apq8016_sbc and forcing them to figure out
which clock to use.

On MSM8916, a hack is currently used to control the LPAIF_DIG_CLK directly
through the GCC driver, but on devices with the newer firmware, the
INTERNAL_DIGITAL_CODEC_CORE clock provided by q6afe-clocks in the qdsp6
driver can be used instead. Add a fallback to make this clock work with
the older firmware too, allowing one to specify it as the codec's "mclk"
in the device tree:

  compatible = "qcom,msm8916-wcd-digital-codec";
  clocks = <&xo_board>,
           <&q6afecc LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE
                     LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
  clock-names = "ahbix", "mclk";
  assigned-clocks = <&q6afecc LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE
                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
  assigned-clock-rates = <9600000>;

This works both on MSM8916 and on the newer SoCs mentioned above.

Otto Pflüger (3):
  ASoC: qcom: q6core: expose ADSP core firmware version
  ASoC: qcom: q6afe: check ADSP version when setting clocks
  ASoC: qcom: q6afe: remove "port already open" error

 sound/soc/qcom/qdsp6/q6afe.c  | 85 +++++++++++++++++++++++++++++++++--
 sound/soc/qcom/qdsp6/q6core.c | 61 +++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/q6core.h |  9 ++++
 3 files changed, 152 insertions(+), 3 deletions(-)


base-commit: e3b18f7200f45d66f7141136c25554ac1e82009b
-- 
2.39.2
