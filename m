Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FD063CC37
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Nov 2022 01:07:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6FC016A3;
	Wed, 30 Nov 2022 01:07:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6FC016A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669766877;
	bh=aYc5aiemDyUpwG5bKAXR2b2l5eCek4JVHOeT7Vm3QUc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SM3Yk9jpYE0RK5oyn60QeMti8HyybOkotLopRYyuEN0XTDQUdaDMWzzZi5QuFy84Q
	 fHRXjF3wVuJU0Jsbx+cAvhRMnjckKUAg53Thi48QmXzpFD0Vd6ER6uDJEXNPirYvhd
	 s0dryR4GeR4hZf8pD4ypqgPN2hHpA5nTloib8Vpg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E0ADF80224;
	Wed, 30 Nov 2022 01:07:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3000F801F7; Wed, 30 Nov 2022 01:06:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E512F80137
 for <alsa-devel@alsa-project.org>; Wed, 30 Nov 2022 01:06:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E512F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ERl+c/rc"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B7BF0B8197C;
 Wed, 30 Nov 2022 00:06:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AEB7C433C1;
 Wed, 30 Nov 2022 00:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669766813;
 bh=aYc5aiemDyUpwG5bKAXR2b2l5eCek4JVHOeT7Vm3QUc=;
 h=From:To:Cc:Subject:Date:From;
 b=ERl+c/rck6NYMeTx33GvpMUFguOgbaRkyvhzlcyfvgSamXuHvZMLudmp8fxi1Mxn/
 gEQT8b1VzZj1vZXoQnCncsqhnC/Tk9e6ePbvrYxGqcYUEZhaMzfomA34/LsX5W3AmT
 vVwjh9hU6XCnCycK+03+RoSmerPThAkuNa46MCd+R3W3xU0Xy5K0l9mUd+GVjVZZh4
 Qi9PsBUJDyHtiJIqGt8bhUJzItzyAosJkiDz6Ez/FJwl8CFzHbgzHUahC8usVM3jQt
 QwV9bmbXsDdN6Dbqh+74KCkfuWDexqrkgLrqVmTM7IWUutGI1gXuDMkod8okfNslM+
 GLjzBjr8zIxQg==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>,
 Shuah Khan <shuah@kernel.org>
Subject: [PATCH v1 0/6] kselftest/alsa: pcm-test improvements
Date: Wed, 30 Nov 2022 00:06:02 +0000
Message-Id: <20221130000608.519574-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1257; i=broonie@kernel.org;
 h=from:subject; bh=aYc5aiemDyUpwG5bKAXR2b2l5eCek4JVHOeT7Vm3QUc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBjhp5qjNRezU/Mpw4j3O5oOuQVFFLw0IAr8wVZ1oRj
 h7Zhh6qJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY4aeagAKCRAk1otyXVSH0NVVB/
 9sVMOIsEYoMHcH6lLroIWJJ9AKZXLHbMN2tMgmxyM/xB7vkKUwqgJqb+mUdLEAWaECmzIWdy9f+LnH
 GVudsqYVUNXUwVfLuLi2Dq7nHzkq241ot0XO4ppNNjYkEEfKbX0chXoyx1IjtBZpmCVT3U7tRFKSZy
 ZeIqSTQHKNIUGo2jiAdDkuNqI15Ieb0wradK1FgHCmpcgwse2DresFowSka/kEgvyhZWxOmEshoFmJ
 X8nT0pB0hA9A2QbAP0OyQMuRVTVchVHubQ0ZL8OSW57bGbMSUn0w36cBy3huFJczA2tjreuJ/fvoI7
 YZiAyrb1mj+5gYMNGBc8wVaisFJxLx
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

This series provides a bunch of quick updates which should make the
coverage from pcm-test a bit more useful, it adds some support for
skipping tests when the hardware/driver is unable to support the
requested configuration and then expands the set of cases we cover to
include more sample rates and channel counts.  This should exercise
switching between 8kHz and 44.1kHz based rates and ensure that clocking
doesn't get confused by non-stereo channel counts, both of which are I
expect common real world errors, at least for embedded cards.

Mark Brown (6):
  kselftest/alsa: Refactor pcm-test to list the tests to run in a struct
  kselftest/alsa: Report failures to set the requested sample rate as
    skips
  kselftest/alsa: Report failures to set the requested channels as skips
  kselftest/alsa: Don't any configuration in the sample config
  kselftest/alsa: Provide more meaningful names for tests
  kselftest/alsa: Add more coverage of sample rates and channel counts

 .../alsa/conf.d/Lenovo_ThinkPad_P1_Gen2.conf  | 35 ++++----
 tools/testing/selftests/alsa/pcm-test.c       | 88 +++++++++++++------
 2 files changed, 81 insertions(+), 42 deletions(-)


base-commit: 1d8025ec722d5e011f9299c46274eb21fb54a428
-- 
2.30.2

