Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE3D2D517A
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Dec 2020 04:38:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E82016A1;
	Thu, 10 Dec 2020 04:37:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E82016A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607571511;
	bh=aocINnWp3Zrt2telSSq9MH0tacIFI9aXchJY6XZ/Au0=;
	h=Date:Subject:From:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZwBwMQOTcaevBmqZLfHD0A+X6yfX6Iiv9mVuy2RmyhtOeTUVlDEvD0tylpSULtruD
	 KUQ/Dpb90dWKd6dJTknCZ+WohlTCuJDZVskTudplQgHXA9b7xFLUgEOKeF/VQpRZmo
	 Al3ozWbmu/EVErebBb5jXVVGpYYkhBh+YYa75E70=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34153F8016E;
	Thu, 10 Dec 2020 04:36:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F64CF8016E; Thu, 10 Dec 2020 04:36:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com
 [IPv6:2607:f8b0:4864:20::849])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92BAAF800EF
 for <alsa-devel@alsa-project.org>; Thu, 10 Dec 2020 04:36:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92BAAF800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="eokvX26E"
Received: by mail-qt1-x849.google.com with SMTP id z43so2942036qtb.0
 for <alsa-devel@alsa-project.org>; Wed, 09 Dec 2020 19:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=jnPc9/knoSPhD9BZIFTbDr5rJhQYXgnJsxtosYvfIYs=;
 b=eokvX26EdW6niBZxuVHhvDr7gfKwa30ytOd4R/H9/GOO4/80dAFSlet0Os83P0V8Dm
 4jyHLO81BjfN06CUBINtqC4q3p3D6g7pYebK8m65UJSYc9p08MXMHMDVzJRguLHosXsa
 RIx2sv20ryYrkUMCuXZpzzr6w3nvS76tQEoSMcL2nDnZPyxLTbJOmTmBc4NtqStm/WLt
 lgffMuG/12B7JXdl+N8W7fpPQZ99My/anaebCiKtOYxJBwTCY/1hkZ6EGGVz23jTSQVz
 98oQFBGj3XM8I5vHeUteFTL+5QegkujMtNee0HXAgtI1XEikTjtC2Csn9tKpiU10Ug2a
 +8ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=jnPc9/knoSPhD9BZIFTbDr5rJhQYXgnJsxtosYvfIYs=;
 b=fEa0Mb+bfj3FzT0ARlE7+UWqCN2DwjyChXyRZGEKhw2Udt5GTkeyrezqpSPHY9+ahs
 RtR11QWtdi23ODIN/f2pmD8JYvou7x+PtLhMjVV1BNRNv4XO8bCG+AAB2su6tH91B6ww
 o/MeD9hQqjDsHZjIPROojyFI40k4N47jw//ferbdzXAYMT3Qfa3iXrL7GvpaUTHzrYs5
 cLhSMBU3uG6knHoMPYatSoDLpg2QmYd7hQnI4Ko79H1saBMTS87NqjJGhyZnhS/4M0RR
 VUdokp/V0NBMgr7Bv5whbjXS32jFxoGRgCNfipbdL/wBmaBEC3wp5/ICQQrswUBplvUv
 B/Sw==
X-Gm-Message-State: AOAM5323iq7pcVlFbl6sJzBkJWcdLlksXA1ochdGCno7Rqce+TCWjnAe
 PC3zoV3oAMmaawsed0QUf2I0XXG7+ANg
X-Google-Smtp-Source: ABdhPJwFlHZIjbv7hCPMYyKP0/DPeDjBEhEAfXoAla6fJXcFdf3iE65JK0cYdyNVn4zbhd0NWHZoNsuTRn7T
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a05:6214:370:: with SMTP id
 t16mr6776016qvu.22.1607571406647; Wed, 09 Dec 2020 19:36:46 -0800 (PST)
Date: Thu, 10 Dec 2020 11:36:15 +0800
Message-Id: <20201210033617.79300-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
Subject: [PATCH v2 0/2] ASoC: rt1015p: delay 300ms for waiting calibration
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org
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

The 1st patch moves SDB control from DAI ops trigger to DAPM event
(per review comments in v1).

The 2nd patch adds the 300ms delay for waiting calibration.

Changes from v1:
(https://patchwork.kernel.org/project/alsa-devel/patch/20201209033742.3825973-1-tzungbi@google.com/)
- Move the delay from trigger to DAPM event.

Tzung-Bi Shih (2):
  ASoC: rt1015p: move SDB control from trigger to DAPM
  ASoC: rt1015p: delay 300ms after SDB pulling high for calibration

 sound/soc/codecs/rt1015p.c | 54 +++++++++++++-------------------------
 1 file changed, 18 insertions(+), 36 deletions(-)

-- 
2.29.2.576.ga3fc446d84-goog

