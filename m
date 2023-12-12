Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0B780E58B
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Dec 2023 09:10:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9059DA4B;
	Tue, 12 Dec 2023 09:10:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9059DA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702368621;
	bh=OrzPyzSnlQ4w2hZz/Baas4f3W1LzsV2V/lHEDAWTjGs=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=CWvvNAkqS6jAaM2GaiuKmgGkiQkOrlfWRDiYZKyGCHmtoTRJZGoo+4Ux4dUtc/q2h
	 kIaihbNYvhb+182atXDzeEa6J3jLyZ3R98Kp6O/Q9i1QLcoQVWIY+ndDSqCzWzOAOX
	 LVKkbTIJXDZXRnEcxadv1XCDMyNDn4VxLGO1LzeU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF744F8016E; Tue, 12 Dec 2023 09:09:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 316E5F80578;
	Tue, 12 Dec 2023 09:09:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B822F8019B; Tue, 12 Dec 2023 09:08:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DE715F80166
	for <alsa-devel@alsa-project.org>; Tue, 12 Dec 2023 09:08:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE715F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=g/jsDgAU
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40c48d7a7a7so15029665e9.3
        for <alsa-devel@alsa-project.org>;
 Tue, 12 Dec 2023 00:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702368505; x=1702973305;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j7Vc7WfA6zO/nZVypNJ5ZSKRNw4vlGrxvFfZBsf6PZE=;
        b=g/jsDgAUmKjIsD+zpEGIFhG92C25S/Qhv/JOJamHZ9vjQtXWDOV4hMCE6/9rJLurDG
         8aylPPXwj+TzTh5yaEEA9YEBvtiT3pda6unRG53aQagGqdggT5moiiyCwYkXbjHtac//
         I9XlvOgSrq/7J/YBozUEJlhyrU5y5dhP99FHm5DQNmZkDPIc61gYq+7vO6LTea22nyDm
         +wclIe1coZxI0CRsaUHBaMkgZ117PFezRQwDiJeevq1PEiC7UYush4Du6W9TKcc7M5Cg
         AiLJcZ77bJzM03LXP2aQ404P6gzImkkO4hMYUJX1DLthwY2ANcJyJZKbS/6/JaMwUE8a
         CzLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702368505; x=1702973305;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j7Vc7WfA6zO/nZVypNJ5ZSKRNw4vlGrxvFfZBsf6PZE=;
        b=JTvp7Um9C6oR4ouii3nX0jwx6BY8kEtJeMJ40z7B2RebnNg/Tkx6TT0KYm+XzkJayH
         80eN0MwKxsMBobXaT1ZNWGPyuXH6GGekB7I0LW+Q1sC8aP5qj1TRVNoKEBPzW/CviS5x
         jx/RxnsqAnvTV4x2T6qXaMBH9zp07HAk1FE+GLBi8RMu1fk9Sw6q8HIdQFa+pbdiznr/
         qDLpMDFK5S7hAd2OxHTLcJK8A0zUcqy18Gip+sz291iIWJukHfY79v3aKt3VAVQ9xemC
         VB3IlOOBUAM1XctV7qL8CD2Bx055HEs9SPmVaXIIZkfZRbhsSGp5JA2fvLb0DMSvAvuf
         wh1w==
X-Gm-Message-State: AOJu0Yy1QtIIHprRTor/Phl0idEQ/gkFgO0No0EQyHK8OTmqzzPsLe7R
	pAi1LhS2eKEY60BwZ+Nzm9O4GA==
X-Google-Smtp-Source: 
 AGHT+IFpC7/sT0VIDkEJ9Oag1ij5lW+BcSQjyEaC79Eoj7mJ9V5d7dc5CmiB4lNlsj8FfFfc2beOKw==
X-Received: by 2002:a1c:4c07:0:b0:40b:5e1b:54ae with SMTP id
 z7-20020a1c4c07000000b0040b5e1b54aemr3470007wmf.58.1702368504657;
        Tue, 12 Dec 2023 00:08:24 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id
 n10-20020a05600c500a00b004094e565e71sm15609355wmr.23.2023.12.12.00.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 00:08:24 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/2] ASoC: qcom: add sound card support for SM8650
Date: Tue, 12 Dec 2023 09:08:18 +0100
Message-Id: 
 <20231212-topic-sm8650-upstream-snd-card-v1-0-fbfc38471204@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPIUeGUC/x3NMQ7CMAxA0atUnrHUGJUCV0EMJnHAQ9PILgip6
 t0bdXzL/yu4mIrDvVvB5Keuc2kIpw7ih8tbUFMzUE/nQIFwmatG9Ol6GXr8Vl9MeEIvCSNbwjD
 Ia+TMNOYbtEg1yfo/Bo/ntu1u7ASicAAAAA==
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=744;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=OrzPyzSnlQ4w2hZz/Baas4f3W1LzsV2V/lHEDAWTjGs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBleBT2CPZAHiWYnl772ED0TNHbAgYjtuRnkahPbmGn
 3VyDLO+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZXgU9gAKCRB33NvayMhJ0UBCD/
 9aS6SDPueYXQWfGRWKZB57ZqiqxFUMnfUecohs0K3A9LsjgvoT4R7lH6F34NLx6LH+WvzRW6pk1TUx
 3UoDBwn8tSItLhAVVeMl2CVJASIf/WjJ4yfBJ/h1lSbcrK0w6BbudEgoa8IrWHbvs2hkG4RJKWxyRl
 wKw6QHOrLYa8tkL+R2KNBq1ncJrCvClS4BKKEuWE1fE/1++ETTHrFA5N83pK/aOmyTgLhxSZVI/e4A
 jpkOIe6EZ832SoOZqB1R8p9HE92d73wgl6jkTSIY9wGdlvtyGuzwiIoDQvJLrmIdbWXKm2M5dWEoZ3
 wqQ34Q1SEXvdQRdOXxNh1RvMvNFm2vM4Ustviq0Tq0vDzA7ipLgB/J4PpPK7w66xhchhKCYEqQN2F8
 GFLAFbRPO4EWOCMNGHL0lDHrma6kQxN0NzNRuys1ZVCgj4iLwWk+y/8Usf2pABq4lZQB3dY+BiuKkb
 c6BlS2j1VD9GlzdWVVgWRgW9/AC1byA/lpMtuvC7UdbHBwPijaSd9iMPzXvAm8+o+pmY1u6DpphYNU
 8p0cQKWqjzRHhWwwhiDRQV2OZPoq+HBSTYWSL6E3C+ufMgyPh+hfynBBUDUplSGC3gt2yeIU6wLgrh
 qOxB2BpJRdk/+JUqbesJAv1m9D6tXx14XEFPbdEBR3szRjrFgz2NzdQvBUGw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Message-ID-Hash: RUIAGH4MXDUP5FQHJVOYVXGOMWO5C4W5
X-Message-ID-Hash: RUIAGH4MXDUP5FQHJVOYVXGOMWO5C4W5
X-MailFrom: neil.armstrong@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RUIAGH4MXDUP5FQHJVOYVXGOMWO5C4W5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Document the SM8650 sound card using the SM8450 fallback
and add the SM8650 compatible to the sc8280xp sound card
driver to use the sm8650 card driver_name like SM8450 & SM8550.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (2):
      ASoC: dt-bindings: qcom,sm8250: document SM8650 sound card
      ASoC: qcom: sc8280xp: Add support for SM8650

 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 sound/soc/qcom/sc8280xp.c                                | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: bbd220ce4e29ed55ab079007cff0b550895258eb
change-id: 20231212-topic-sm8650-upstream-snd-card-15eb7afa27f9

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

