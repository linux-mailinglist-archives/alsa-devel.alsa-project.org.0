Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AD47D392E
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 16:19:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA4F1AE9;
	Mon, 23 Oct 2023 16:18:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA4F1AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698070789;
	bh=vWCRQ4fNqO5LRt80eRCCPf+N3EAHFNSQHWlhv9+dG6E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TtvRKoKS9rZAxsNoDlPQJISaF0OAAPHXSUoU3C5u4fkVgRwpD7yQYodJ/q4WfTjxv
	 8RmouMxYRwH2VRmnGS5cWZ6RC0A9TjOvXhUueCVJK2VK13URNsmtt3kBk0H3oyx/85
	 1uzq8SGvss7VLrGLGwDzRMQlOUA5DdoVFejP5dME=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03C21F80589; Mon, 23 Oct 2023 16:17:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8897BF8057E;
	Mon, 23 Oct 2023 16:17:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8850AF8025F; Fri, 20 Oct 2023 17:35:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from box.trvn.ru (box.trvn.ru [194.87.146.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 70F38F800C9
	for <alsa-devel@alsa-project.org>; Fri, 20 Oct 2023 17:34:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70F38F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=trvn.ru header.i=@trvn.ru header.a=rsa-sha256
 header.s=mail header.b=Z5L8FNDH
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 0015C4196A;
	Fri, 20 Oct 2023 20:34:11 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1697816052; bh=vWCRQ4fNqO5LRt80eRCCPf+N3EAHFNSQHWlhv9+dG6E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Z5L8FNDHYVBWFYR9uyEnwZMsgSWAsqlUfbTtakJ/TMRhONV/QkHnm0lEqnlsogkgz
	 yHOaFyEDZLarArP+uO5ELIebdAt0fs/XFPZ/0m2lCVCJtuAwO8lGM+ttEjzN0h9vO7
	 O27uay2hl4KnH1YTPO3wmIA+A0pzfILS3L2nh1FODUbrBiENORTCIMhpv3VoVxZRi3
	 WPN/gfLxe/fpYeNQc2adVVDN8JAelNxH7J1YW8eFlHWCcWb/plmdxraFa8b8AldWuz
	 QoqXwK6zLGyTRqEftjkyMn6sD/nZxVuZyhMfURLm17A3Ii5xQADyevclHH0WJ0jL5/
	 gDooo9iaZPscw==
From: Nikita Travkin <nikita@trvn.ru>
Date: Fri, 20 Oct 2023 20:33:46 +0500
Subject: [PATCH 1/2] ASoC: dt-bindings: qcom,sm8250: Add
 sc7180-qdsp6-sndcard
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231020-sc7180-qdsp-sndcard-v1-1-157706b7d06f@trvn.ru>
References: <20231020-sc7180-qdsp-sndcard-v1-0-157706b7d06f@trvn.ru>
In-Reply-To: <20231020-sc7180-qdsp-sndcard-v1-0-157706b7d06f@trvn.ru>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: jenneron@postmarketos.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nikita Travkin <nikita@trvn.ru>
X-Developer-Signature: v=1; a=openpgp-sha256; l=860; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=vWCRQ4fNqO5LRt80eRCCPf+N3EAHFNSQHWlhv9+dG6E=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBlMp3yDEpr0K/LD9Xkj5hdVslBNDAbnX6DeW10o
 V2dYQ3vvpWJAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCZTKd8gAKCRBDHOzuKBm/
 dQxLEACIgUXHeK+5Mt/vq/zZhrJ6L8IscDRn96d3J9M5M3UFS8rBRJhkZwS1yzijdRdklGJc+bJ
 67jfqHdMxEWEw+1lLnl36JnPO6Rp6hHYQGnVioObJ/C+G+LdZiKl5Io64RE/S+uJ5YiObB5UfFP
 5KOvW68PL9J5YILWCkZIuA+HkBwe0tUr5bC+8n/ps1Y/BxsgzhQx6KkwQFGNwDQxlTPD0aQQFrD
 nwfPmVYElfosTlxDgxRbxpdpX/aG8OaEZ3mRwj/a0TZwh2xuZh+76dhNRP1Lq+iWrRHVRVpVrGt
 TsTVUyQbM/ruIjLsNuS8y4KGVSASAT1UJb7ukkZ2ggsreO6h63aoeOIlYC/ZQNCe6sfAXTUsj7N
 IFfeUkKSKs1zWsMxLiZQgXzHqtMtFGx+vGEqZeTUJ0P8j4GhBZ/d02LgSfFoHmD2y6O7zACu/Fi
 NirMMU/b9RZtVK/wvZjwGUKW3+ayLUqoTznBsEkL7qvo5rvuWFZR0fH7tiweubxwXlcUuBXXfMO
 l8aWeqd/LuqGYBAIfPdOFXNc4FBoTaPB5qIMqRda9mMhMg7s92XX+cdV5bXP1/WhChiAFaVCjbW
 sYAQ/cSIhUCyGSvf8lhjfeljKxtbZG2my3DC+4TYcS0jdPDVg7SV89MvoB8Kg8WVkj5FHhqHmS8
 gaJOOsSZnpyWFPA==
X-Developer-Key: i=nikita@trvn.ru; a=openpgp;
 fpr=C084AF54523FAA837E2EC547431CECEE2819BF75
X-MailFrom: nikita@trvn.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4ARIFAQJSU3PR4P7AIFJPYQPJ3C52F3H
X-Message-ID-Hash: 4ARIFAQJSU3PR4P7AIFJPYQPJ3C52F3H
X-Mailman-Approved-At: Mon, 23 Oct 2023 14:17:43 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4ARIFAQJSU3PR4P7AIFJPYQPJ3C52F3H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

sc7180 can make use of the adsp-baked soundcard, add relevant compatible
to the documentation.

Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 262de7a60a73..e082a4fe095d 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -25,6 +25,7 @@ properties:
           - qcom,apq8016-sbc-sndcard
           - qcom,msm8916-qdsp6-sndcard
           - qcom,qrb5165-rb5-sndcard
+          - qcom,sc7180-qdsp6-sndcard
           - qcom,sc8280xp-sndcard
           - qcom,sdm845-sndcard
           - qcom,sm8250-sndcard

-- 
2.41.0

