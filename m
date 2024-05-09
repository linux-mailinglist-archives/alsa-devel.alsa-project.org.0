Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCD08C0BC5
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 08:55:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16F9FDF6;
	Thu,  9 May 2024 08:55:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16F9FDF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715237715;
	bh=rOxCVpuvUmbACYXpkXKZKRD3h2JXgl6Ma28qOmXdJFk=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vNEWkqGcIjoeGfFs1HlOb0f7e1UdgkkBwlr+Hg//DYVA70l0JQvnq5f3VilnSCIAM
	 omKl9ZlcAsh5cjjTV2le2Bk8afW9Ti5sl7JGepl/rajbTDs88RsqIZwv/V7EZhzGrK
	 zsPKJpjHXZk/TOwWHBJFSOqJn4S+f4oVpBUr9owk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC963F805A0; Thu,  9 May 2024 08:54:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 38080F80589;
	Thu,  9 May 2024 08:54:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B64CF80423; Thu,  9 May 2024 08:54:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C338CF8049C
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 08:52:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C338CF8049C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=uDiRAE2r
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a59a0e4b773so108622566b.2
        for <alsa-devel@alsa-project.org>;
 Wed, 08 May 2024 23:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715237523; x=1715842323;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7rnP8lifwF80Zq93ecat3fo7l4f28X4MCb0bTfRERyQ=;
        b=uDiRAE2r6OFQgOJRWmKNKp6ETnzmfA3a6odwKjgEwRmapIsa1LbJY2bJyxaef++s2D
         vM5ib3XMYWXUmsje7fXrz0a9FU1CRC4+Ff2WwEv8pnRchRsF+/4EU8H59mlMWPj4MtBO
         zhRlslFRD4ThD2n0IWROVzzUqhvvsU2U0qzl+N6B8THPQzc8Rycsl68ZTi6HdNktZx9O
         keZpY9VtV7Y3Mcr5eLu2C86hP5gAE0OAXd4iH++o1wF5qulqJlY+/ssjs0YxHenuUwSs
         AtqYKiRV3UrcIyVRzKblvmYO14CLTfdkrtDDaCfCFZtI57SQ+yOQ5UFJfnJbNQnmeA78
         Xe/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715237523; x=1715842323;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7rnP8lifwF80Zq93ecat3fo7l4f28X4MCb0bTfRERyQ=;
        b=E0O57Nmm2XtMPp4CzI8Ry4O/IStZ0mzjgDv7S/7DbL9pb8YXH/vXdaZbcGCOwAjd5u
         6iUpfgFsBHiJ8UHcltPFE9jxPSnVtV2RXcGKPI/8PvRx429U6VCnFhZCmzj8D9xLa95E
         qp1Ach33WW5OtAw3Y2q+sRoCojB7Dj+tPOwQwwt3/NJktbxnY05BW9Z+PKumwM1wGwU4
         wbdJdLHWxk7nf+WmvoWR0NzeYHxcWLQWjgupgJVa5lbuJ/2t4747GmK2iedV6CyIr9xq
         jKBgw0rRE58L9b02rEr/0qs86r7D8nkBvRtB9LS91yINKnIuUzUNOT30U53hVhNqPfE+
         wiYQ==
X-Gm-Message-State: AOJu0YzXTyyh6oUcGJKMOaEZjMmrMeblc/+7w8C4dHbN4Va08q2bKaVi
	LRszdN3pQI9RLtsAOf1OtQ32Tag2cnH7NwQEE9aUO4HjrALYkEpxA2XUKvup+W0=
X-Google-Smtp-Source: 
 AGHT+IFdc13lszpf7lxX/nmLUxwCIGMYlPf62pSkNTQt4xpiimPjtHkcnxTGJfCijKqU+LZx+421gg==
X-Received: by 2002:a17:906:3c08:b0:a5a:15ac:13fa with SMTP id
 a640c23a62f3a-a5a15ac1545mr60104166b.38.1715237522834;
        Wed, 08 May 2024 23:52:02 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c81b4sm40730966b.113.2024.05.08.23.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 23:52:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 0/4] ASoC: qcom: x1e80100: Correct channel mapping
Date: Thu, 09 May 2024 08:51:51 +0200
Message-Id: 
 <20240509-asoc-x1e80100-4-channel-mapping-v3-0-6f874552d7b2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIdyPGYC/43NTQ6CMBCG4auQrh0zLZQfV97DuChlgCbYktY0G
 MLdLax0pct3Mnm+lQXyhgK7ZCvzFE0wzqbITxnTo7IDgelSM4GiQIkVqOA0LJxq5IhQwP5laYK
 HmmdjByAlexRtQ2VVs6TMnnqzHAu3e+rRhKfzr2Mw8v36vx05ILRcaJ4TKim762Ss8u7s/MB2P
 IpPsP4NigRqTX2jylLJSnyB27a9AS0hH3sgAQAA
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2549;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=rOxCVpuvUmbACYXpkXKZKRD3h2JXgl6Ma28qOmXdJFk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmPHKK+jVIzjueNuFIpjzLc9l0An3OYN7GlvfDY
 r/bfc0O8A+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjxyigAKCRDBN2bmhouD
 1xX3EACFu/Wuja+nxzB5jFUGdRcGxTyLQNgkhNQkHXBONE9jJdNSUm0BlyHE78b6wPVxwiYbuyM
 kkSxNw0UlZOHUrLn8eSWXDJYVXXOqDFUM5P4TXS3UVPbGguTL5hw6CZJWbDkVTGCgQ7PR1+ghWj
 J64mXAZdnY+BjQ7PPvP5MpxdfuHIrJu0jcNI6/Jgfam0GDcCADhXHzmITQsjZyjAUhKDolhSpVy
 Ln1DNg2myYcHCYSb+eZieOC68XEDzDCb5gkdLL95xe+36rXWVgN3obOsVXys4WSiIEXMKse6Lm9
 NYbCRq/OXov1nG0EFDae55WzY3upKHAGWNib3cGW7UDZ2MUkR7X501nII5BDB0s3SilXNmXmAuM
 sZT1/pufvqXxCCndfx8fwiarp1LVpwMaeHL262ODAcgSY/TPxQsGWjekujtAIVxJ2FRoounknfk
 rLN+umADyowLivtNDX/2rNywtuhhPHKVzMZz/wB/MAU6Ik82b9x0EIPawIkZMhnu8ENg9OddgeF
 LGnFCfSYP3OdxNPG6+Wun3P1mcB5MZmJ3Ujn5nPq0BtnT5r0sO0XkRBDzJSGiIj0v0Q9vte3CiA
 fywMS6aYF2xRvq94fU4wJgfda3xHAmEI7ktV7xD9UWFCOpRfVdk/c0rM9NmSUzf8x7HGzMx4fza
 SL4xj09R6U4NphQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: UAZLOBMFEFTMM2HIFUTDH56Y7K2C2UT7
X-Message-ID-Hash: UAZLOBMFEFTMM2HIFUTDH56Y7K2C2UT7
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UAZLOBMFEFTMM2HIFUTDH56Y7K2C2UT7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

First patch is a build dependency.

Changes in v3:
- Add missing Charles' Ack
- Link to v2: https://lore.kernel.org/r/20240508-asoc-x1e80100-4-channel-mapping-v2-0-ccef9a66a572@linaro.org

Changes in v2:
- Re-work most of the idea according to Srini comments: set channel
  mapping for backend DAIs, not frontend.
- Patch #1: no changes
- Patch #2 is entirely replaced - now channel mapping is implemented in
  q6apm-lpass-dais.
- Patch #3: rework to new approach, but most of the code stays.
- Patch #4: rework significantly, because only backend DAIs is now
  affected.
- Link to v1: https://lore.kernel.org/r/20240507-asoc-x1e80100-4-channel-mapping-v1-0-b12c13e0a55d@linaro.org

Description
===========
X1E80100 CRD is the first board, which comes with four speakers, so we
still keep fixing and adding missing pieces.

The board has speaker arranged as left front+back and then right
front+back.  Using default channel mapping causes front right speaker to
play left back stream.

Adjust the channel maps for frontend DAIs to fix stereo and four-channel
playback.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      ASoC: Constify channel mapping array arguments in set_channel_map()
      ASoC: qcom: q6apm-lpass-dais: Implement proper channel mapping
      ASoC: qcom: qdsp6: Set channel mapping instead of fixed defaults
      ASoC: qcom: x1e80100: Correct channel mapping

 include/sound/cs35l41.h                 |  4 ++--
 include/sound/soc-dai.h                 |  8 ++++----
 sound/soc/codecs/adau7118.c             |  6 ++++--
 sound/soc/codecs/cs35l41-lib.c          |  4 ++--
 sound/soc/codecs/cs35l41.c              |  3 ++-
 sound/soc/codecs/max98504.c             |  6 ++++--
 sound/soc/codecs/wcd9335.c              |  6 ++++--
 sound/soc/codecs/wcd934x.c              |  6 ++++--
 sound/soc/qcom/qdsp6/audioreach.c       | 30 +++++++-----------------------
 sound/soc/qcom/qdsp6/audioreach.h       |  2 +-
 sound/soc/qcom/qdsp6/q6afe-dai.c        | 16 ++++++++++------
 sound/soc/qcom/qdsp6/q6apm-dai.c        |  2 ++
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 21 +++++++++++++--------
 sound/soc/qcom/x1e80100.c               | 18 ++++++++++++++++++
 sound/soc/soc-dai.c                     |  4 ++--
 15 files changed, 79 insertions(+), 57 deletions(-)
---
base-commit: 2b84edefcad14934796fad37b16512b6a2ca467e
change-id: 20240507-asoc-x1e80100-4-channel-mapping-ea5f02b9e678

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

