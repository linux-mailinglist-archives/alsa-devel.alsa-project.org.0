Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D690341C0C
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 08:13:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 734FC1727;
	Wed, 12 Jun 2019 08:12:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 734FC1727
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560320012;
	bh=dGd5cseb6XTjhjASF5Xf5oE9L0s/IsBxZon0piL5H0Y=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wi4zhGQpkWa+Qn7eQWBw643i12EFc0vNda/l4QIUOtuHcs6JhUIqRHMABRuydE+A+
	 yCq2Va172GeCvdhgGHW0vNQj1RaukHXKF+KvhHr2F9gBO+LFu7xTaKdGC0u55fNbVt
	 vETmakda2kOzqkovVvlgcBUCg8h1riFhw3vaD0c0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5DD0F8974C;
	Wed, 12 Jun 2019 08:09:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50D26F89738; Wed, 12 Jun 2019 08:08:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A74E0F8970C
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 08:08:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A74E0F8970C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mforney-org.20150623.gappssmtp.com
 header.i=@mforney-org.20150623.gappssmtp.com header.b="iqtlDTqy"
Received: by mail-pl1-x641.google.com with SMTP id p1so6178237plo.2
 for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2019 23:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mforney-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4dKR7v40GtuWzgtJckfgvshDXWiu9qoULi4qhMoz2+4=;
 b=iqtlDTqy+LFo34WJq6Ce3dXphaFmLS92C1lAtuvV/BYss7zgRXY+8OC1KSPAXEJ63n
 FqLOuO0rNkGCqB4p2EZSUYi4z1TFCEOzJ5Istdw2iANc1dE9qjqdJv8HfvcWX0dJfz/h
 snGjrD4SQuLNJQ2qQXtrRu953d64bsq4E2WlSeKhZIw+r73wUvVXN67ZS7Ivvo48lFfc
 s/YLpYJWkI3weTxhu3sk/jREAcvLNf/bjG5/FG3YM3HbkbJIY+8+h14xI0TG6pGBSiVa
 TU12S0V3yZuvVHkozXcb4hyU7ZKr5OTqoyhxB1UhdzXb+mnz9Ras79mPdDpTHEXtOboB
 /YxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4dKR7v40GtuWzgtJckfgvshDXWiu9qoULi4qhMoz2+4=;
 b=hcmGSliBp4Y8RAffOkx/uVLf5kX77QmDO572/fmYMpNNKRh/JcJNa1kdKrl/j1gg1l
 gfWhp7kRW7Nmu61sbAQr6RWy2EbgwMYbNoacXYXe2E3WakB0de4lMXrwchddsYSjXkCL
 ivwGpYizcO902UWQ/jJFtPOEbVSBMz/+CeQsiFfOV773gY4CjYn/A65lpc4TwW3W/hr2
 CG58sJBQXnjv/D0jpKwA6MLB7dbWZ3Prcf/A+Wsrw8uq5i3LKPRVVZhVCuhP47wgvZZe
 Hphc+0xGAVGgqkf9403EPYhXM1OS9qWtekXhYYiTVKyRC5X7m0XQ9mBzibZQV92503ga
 rxdw==
X-Gm-Message-State: APjAAAUe37tgckbjF3LZnbzUS9wStdpqtcxv/v89XOjp2NeZY+HsiGyU
 +MQvHF+zRT1amJ52vMKzlGiFSw==
X-Google-Smtp-Source: APXvYqzy6BvHAf+JJ7GsTkOO3NeK+SNQvOP8+66OPvuKYkO/oVencGBvWUZOdeQIe5TrH0uUF13nCQ==
X-Received: by 2002:a17:902:6ac6:: with SMTP id
 i6mr66073083plt.233.1560319700836; 
 Tue, 11 Jun 2019 23:08:20 -0700 (PDT)
Received: from localhost ([2601:647:5180:35d7::cf52])
 by smtp.gmail.com with ESMTPSA id t184sm1289388pgt.88.2019.06.11.23.08.20
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 23:08:20 -0700 (PDT)
From: Michael Forney <mforney@mforney.org>
To: patch@alsa-project.org
Date: Tue, 11 Jun 2019 23:08:12 -0700
Message-Id: <20190612060814.13534-5-mforney@mforney.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612060814.13534-1-mforney@mforney.org>
References: <20190612060814.13534-1-mforney@mforney.org>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 4/6] Make sure parameter qualifiers match
	between declaration and definition
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Signed-off-by: Michael Forney <mforney@mforney.org>
---
 src/pcm/pcm.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/src/pcm/pcm.c b/src/pcm/pcm.c
index fa51ca99..e0ceccc4 100644
--- a/src/pcm/pcm.c
+++ b/src/pcm/pcm.c
@@ -1997,7 +1997,7 @@ static const char *const snd_pcm_tstamp_type_names[] = {
  * \param stream PCM stream type
  * \return ascii name of PCM stream type
  */
-const char *snd_pcm_stream_name(snd_pcm_stream_t stream)
+const char *snd_pcm_stream_name(const snd_pcm_stream_t stream)
 {
 	if (stream > SND_PCM_STREAM_LAST)
 		return NULL;
@@ -2009,7 +2009,7 @@ const char *snd_pcm_stream_name(snd_pcm_stream_t stream)
  * \param acc PCM access type
  * \return ascii name of PCM access type
  */
-const char *snd_pcm_access_name(snd_pcm_access_t acc)
+const char *snd_pcm_access_name(const snd_pcm_access_t acc)
 {
 	if (acc > SND_PCM_ACCESS_LAST)
 		return NULL;
@@ -2021,7 +2021,7 @@ const char *snd_pcm_access_name(snd_pcm_access_t acc)
  * \param format PCM sample format
  * \return ascii name of PCM sample format
  */
-const char *snd_pcm_format_name(snd_pcm_format_t format)
+const char *snd_pcm_format_name(const snd_pcm_format_t format)
 {
 	if (format > SND_PCM_FORMAT_LAST)
 		return NULL;
@@ -2033,7 +2033,7 @@ const char *snd_pcm_format_name(snd_pcm_format_t format)
  * \param format PCM sample format
  * \return ascii description of PCM sample format
  */
-const char *snd_pcm_format_description(snd_pcm_format_t format)
+const char *snd_pcm_format_description(const snd_pcm_format_t format)
 {
 	if (format > SND_PCM_FORMAT_LAST)
 		return NULL;
@@ -2072,7 +2072,7 @@ snd_pcm_format_t snd_pcm_format_value(const char* name)
  * \param subformat PCM sample subformat
  * \return ascii name of PCM sample subformat
  */
-const char *snd_pcm_subformat_name(snd_pcm_subformat_t subformat)
+const char *snd_pcm_subformat_name(const snd_pcm_subformat_t subformat)
 {
 	if (subformat > SND_PCM_SUBFORMAT_LAST)
 		return NULL;
@@ -2084,7 +2084,7 @@ const char *snd_pcm_subformat_name(snd_pcm_subformat_t subformat)
  * \param subformat PCM sample subformat
  * \return ascii description of PCM sample subformat
  */
-const char *snd_pcm_subformat_description(snd_pcm_subformat_t subformat)
+const char *snd_pcm_subformat_description(const snd_pcm_subformat_t subformat)
 {
 	if (subformat > SND_PCM_SUBFORMAT_LAST)
 		return NULL;
@@ -2128,7 +2128,7 @@ link_warning(snd_pcm_xrun_mode_name, "Warning: xrun_mode is deprecated, consider
  * \param mode PCM tstamp mode
  * \return ascii name of PCM tstamp mode setting
  */
-const char *snd_pcm_tstamp_mode_name(snd_pcm_tstamp_t mode)
+const char *snd_pcm_tstamp_mode_name(const snd_pcm_tstamp_t mode)
 {
 	if (mode > SND_PCM_TSTAMP_LAST)
 		return NULL;
@@ -2152,7 +2152,7 @@ const char *snd_pcm_tstamp_type_name(snd_pcm_tstamp_type_t type)
  * \param state PCM state
  * \return ascii name of PCM state
  */
-const char *snd_pcm_state_name(snd_pcm_state_t state)
+const char *snd_pcm_state_name(const snd_pcm_state_t state)
 {
 	if (state > SND_PCM_STATE_LAST)
 		return NULL;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
