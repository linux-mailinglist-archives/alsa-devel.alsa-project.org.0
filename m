Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF563264DD
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Feb 2021 16:44:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA06C10E;
	Fri, 26 Feb 2021 16:43:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA06C10E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614354279;
	bh=8su8N7kpnGqd7uYSGLCq8VFE5LjnQc92sQr14EqIN1Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lss2w+mKcfaRXNP/hE8xJyeKVfhg7Fk3xgGjWoRFFKrsAhRp6eA5DX3+9GqoTrfSA
	 1hrJtaY44ro2SLNJyyZWYbD/0/Aq1D58F/z3/Wmadcxy04P4BonbaUvr5J3iY/ShYU
	 Lo7B+rRxdhcpfObOwpTQi3LxGpGgWfCkptmfB/Bw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B87DDF804AC;
	Fri, 26 Feb 2021 16:40:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1027F802E2; Fri, 26 Feb 2021 16:40:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5A6DF80154
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 16:40:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5A6DF80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Xhlktajk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614354041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A2dNc7YHrTVAhjNJuNub3LKHAh9CuFHIIOp3bJT789c=;
 b=Xhlktajkl5VtNLrb+FFS2gUpvzzbxQaR+SF1XqERPZH+vf+IzTCihdPkJsWtzWrVdf1ERg
 M4pJ0AFHJr/S5A5MMmdthfr/5sANdI9QHnhfim0Os5ALNUeJC3UN1lufrIQQGsGjCnGTVQ
 C8P8X5i90DZiiHzB4aYMaJefXY3WcJs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-AvM0JCAkNeaiHGiKSQYBug-1; Fri, 26 Feb 2021 10:40:36 -0500
X-MC-Unique: AvM0JCAkNeaiHGiKSQYBug-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A10480402E;
 Fri, 26 Feb 2021 15:40:35 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-36.ams2.redhat.com [10.36.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75CF21050E;
 Fri, 26 Feb 2021 15:40:34 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH alsa-ucm-conf 5/8] codecs/rt5640: Unify capture volume for
 AIF1 and AIF2 recording paths
Date: Fri, 26 Feb 2021 16:40:22 +0100
Message-Id: <20210226154025.84828-6-hdegoede@redhat.com>
In-Reply-To: <20210226154025.84828-1-hdegoede@redhat.com>
References: <20210226154025.84828-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <bard.liao@intel.com>
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

The rt5640 codec is sometimes used with AIF1 connected to the
SoC and sometimes with AIF2 connected to the SoC.

The rt5640 UCM configuration deals with this by accepting input from
and sending output to both AIFs, relying on the kernels DAPM framework to
disable parts of the graph which are connected to the unconnected AIF.

Before this commit codecs/rt5640/EnableSeq.conf was adding a +9dB
(digital) boost to recording going through the 'ADC' path to AIF1,
while not touching the 'Mono ADC' path to AIF2.

This was causing recordings on devices using AIF2 to be somewhat soft.

This commit unifies the record volume control settings for both paths by
only using the '[Mono ]ADC Capture Volume' control, which is present
in both paths and setting it to +9dB on both paths.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 ucm2/codecs/rt5640/EnableSeq.conf | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/ucm2/codecs/rt5640/EnableSeq.conf b/ucm2/codecs/rt5640/EnableSeq.conf
index 223cceb..8b30153 100644
--- a/ucm2/codecs/rt5640/EnableSeq.conf
+++ b/ucm2/codecs/rt5640/EnableSeq.conf
@@ -39,10 +39,14 @@ EnableSequence [
 	cset "name='Mono ADC R2 Mux' DMIC R1"
 	cset "name='Mono ADC Capture Switch' on"
 
-	# 47=0dB, 0.375 dB/step, set it to 6 dB to help with soft mics
-	cset "name='ADC Capture Volume' 63"
-	# Set ADC Boost Gain to 3dB higher vals result in too much noise
-	cset "name='ADC Boost Gain' 1"
+	# 47=0dB, 0.375 dB/step, set it to 9 dB to help with soft mics
+	cset "name='ADC Capture Volume' 71"
+	cset "name='Mono ADC Capture Volume' 71"
+
+	# The second 'Mono ADC' path does not have a 'Boost Gain',
+        # set this to 0dB so that the volume of the AIF1 and AIF2 paths is equal.
+	cset "name='ADC Boost Gain' 0"
+
 	# Set IN1/IN3 internal mic boost to 8 (max)
 	# Set IN2 headset-mic boost to 1, headset mics are quite loud
 	cset "name='IN1 Boost' 8"
-- 
2.30.1

