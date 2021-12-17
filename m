Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF164478BF7
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Dec 2021 14:04:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 811AE2857;
	Fri, 17 Dec 2021 14:03:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 811AE2857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639746251;
	bh=49hLGTchRJ2Hk5xl4QHps7qmByi8UxeYOFjwOmMV8lE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z2I3ibKR6Ra/6FPe7cUCsMM7zHOukIuxUnWC9jVazsAIcwLqV4dxEXOgWVudDwg6H
	 cHypr3u/lfPinngn/SSFABqmrvFPnaMbNmJ6lySfvstEnUCCigcQn7STfdJktIaCML
	 bt0Mh1G59OHUME6ckoLVO3OWHny6g+1PN7eMF9as=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA73CF80161;
	Fri, 17 Dec 2021 14:03:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AC1DF8014D; Fri, 17 Dec 2021 14:03:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1354F80143
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 14:02:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1354F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="m5Yc/v4H"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CCBBEB827E8;
 Fri, 17 Dec 2021 13:02:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A46EC36AE1;
 Fri, 17 Dec 2021 13:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639746176;
 bh=49hLGTchRJ2Hk5xl4QHps7qmByi8UxeYOFjwOmMV8lE=;
 h=From:To:Cc:Subject:Date:From;
 b=m5Yc/v4HY1ojcF/RDjAj8L8iASEnT2gNcbcEPOGjEnu2zuWGlllOO0wo0F1KQI/H7
 5PWdvvcI1H+8eSI92KtNDIvOyOasiDrebB4uLCLHAOpIy4vApILjtpd9ifrKsmA40z
 dfVHeXqpjMUtwnIE9LngtEgAoqXTaocWiLz0ivBwGSXh0cJlL4FWXcj74/u8IMl99h
 1rSXge2DMYjjoJIfhPWmeRyvGy6iZuXUqBvSeBIbY8U61BGOGzToohS+bmsBNKsO1U
 x3BF5kQfA85ZhMZlzgzpVkSwpQUtqYHtPnvCRkfiO/+xwPbE8ZSvEnQ9RLJa+WB4aA
 rP38wtQ42bipw==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>,
 Shuah Khan <shuah@kernel.org>
Subject: [PATCH v1 0/2] kselftest: alsa: Small enhancements to mixer-test
Date: Fri, 17 Dec 2021 13:02:11 +0000
Message-Id: <20211217130213.3893415-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=621; h=from:subject;
 bh=49hLGTchRJ2Hk5xl4QHps7qmByi8UxeYOFjwOmMV8lE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhvIpLCX2gvUydmrsOwTwc9j8G5dLbbW7HK6JbFoDD
 0kJNWtaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYbyKSwAKCRAk1otyXVSH0EN9B/
 wK0xX1ZOaUX7Pnr0jfTgk/tHDIBsOeJ5/AOlSUL0veGgPAIpHi/lu0RICLCr2Sy0vhKo79eoChbJ60
 MuZcY1f7beqQ6ddJ4xnCdM7GhMJmwYgFJRtpvo17ASWhzAwKkWIZVECtNjoxw8ZzeASIGpehdSb/o/
 VgsrPLNrysZAuXvMkKpbbrasMewoDrpjS/UgG1M7disBu8BiMTC+tg0WCqI2NyPNUoYuT/zvUgJnsm
 Alo3TZB+gJQChAN+zXZ2DYmWCMKvajhoQ2wyCbphIfBKLJ1RY76iMEqf81a9Dy2dTlKvmE/zQoHYE6
 Mht0yzB/0hLg/yzV9CvJTf9kQGdrlj
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linux-kselftest@vger.kernel.org
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

These two patches improve the mixer test, checking that the default
values for enums are valid and extending them to cover all the values
for multi-value controls, not just the first one.  It also factors out
the validation that values are OK for controls for future reuse.

Mark Brown (2):
  kselftest: alsa: Factor out check that values meet constraints
  kselftest: alsa: Validate values read from enumerations

 tools/testing/selftests/alsa/mixer-test.c | 158 ++++++++++++++--------
 1 file changed, 99 insertions(+), 59 deletions(-)


base-commit: b73dad806533cad55df41a9c0349969b56d4ff7f
-- 
2.30.2

