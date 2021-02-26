Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB8C3264D6
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Feb 2021 16:42:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD7481666;
	Fri, 26 Feb 2021 16:41:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD7481666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614354134;
	bh=DtOkiLnmxGJsNvwlBPVVT9zaBfSyx8w2C9aH+YfW0zo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jSabv8g4vOoBDoqrzfN4bZcbukzRLFYlUrBgbTlElEyyZhDZDtW0Gpav/SyA60Tpa
	 0yihREe42bDqd5N4yDITfEIqjMFSod1yLKbqBYP0Xn8QXgG0DN07wEoUtzOkUmZmj0
	 CnRAu3v2VvhU2uyCajAfo1P7BTWlTr2oQQGaTFc4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66D70F80276;
	Fri, 26 Feb 2021 16:40:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73C85F8022B; Fri, 26 Feb 2021 16:40:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 847CEF8012C
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 16:40:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 847CEF8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Rlfa+TVU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614354031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xvo/Cl/PA78w0aJsjTOiE+EypUuqUyGXqKej6pcuyC8=;
 b=Rlfa+TVUdJ8bn9NbEdiNnO5CHDKKWb7CU2DiojIHfNxupqqzVwXAjoycJsubspktB3JGA4
 kn/O8mWgjPsJh19K1stOHy6BCzQBe+ymgdnMbeqNdvqfM0czlUgaRlBKLy6gyAq9AZV3Su
 8A3+2/Yd2lySRgT+dzEgEmBBrPGNWsU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-lQZgfDydOxaNZDlGlQxyqQ-1; Fri, 26 Feb 2021 10:40:30 -0500
X-MC-Unique: lQZgfDydOxaNZDlGlQxyqQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52847107ACC7;
 Fri, 26 Feb 2021 15:40:28 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-36.ams2.redhat.com [10.36.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8F2A1050E;
 Fri, 26 Feb 2021 15:40:26 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH alsa-ucm-conf 0/8] codecs/rt5640: Cleanup + HW volume control
 support
Date: Fri, 26 Feb 2021 16:40:17 +0100
Message-Id: <20210226154025.84828-1-hdegoede@redhat.com>
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

Hi All,

Here is a patch series consisting of some codecs/rt5640 cleanups and
addition of HW volume control support to the rt5640 .conf snippets.

Note patch 7 and 8 depend on a new "aif:%d" part being added to the
components string, the kernel patches for this are pending upstream
in the "[PATCH 0/5] AsoC: rt5640/rt5651: Volume control fixes" patch
series.

Patches 7 and 8 should probably not be merged until the kernel patches
have landed, because theoretically the new component string part could
change as part of the review of the kernel patches.

Regards,

Hans


Hans de Goede (8):
  codecs/rt5640: Cleanup: unify Stereo / Mono ADC handling
  codecs/rt5640: Cleanup: Initially disable all inputs and outputs
  codecs/rt5640: Cleanup: Move 'SPK MIX' setup to main EnableSequene
  codecs/rt5640: Drop bogus 'DIG MIXL DAC L2 Switch' setting
  codecs/rt5640: Unify capture volume for AIF1 and AIF2 recording paths
  codecs/rt5640: Add hardware volume-control support
  codecs/rt5640: Use the new "aif:%d" part of the components string
  codecs/rt5640: Specify Playback/CaptureMasterElem for HW
    volume-control

 ucm2/bytcr-rt5640/HiFi.conf                   | 46 +++++++++++++++++
 ucm2/codecs/rt5640/DigitalMics.conf           | 18 ++++++-
 ucm2/codecs/rt5640/EnableSeq-AIF-unknown.conf |  7 +++
 ucm2/codecs/rt5640/EnableSeq-AIF1.conf        |  7 +++
 ucm2/codecs/rt5640/EnableSeq-AIF2.conf        |  7 +++
 ucm2/codecs/rt5640/EnableSeq.conf             | 50 ++++++++++++++-----
 ucm2/codecs/rt5640/HeadPhones.conf            | 15 +++++-
 ucm2/codecs/rt5640/HeadsetMic.conf            | 24 ++++++---
 ucm2/codecs/rt5640/IN1-InternalMic.conf       | 27 ++++++----
 ucm2/codecs/rt5640/IN3-InternalMic.conf       | 27 ++++++----
 ucm2/codecs/rt5640/MonoSpeaker.conf           | 17 +++++--
 ucm2/codecs/rt5640/Speaker.conf               | 17 +++++--
 12 files changed, 211 insertions(+), 51 deletions(-)
 create mode 100644 ucm2/codecs/rt5640/EnableSeq-AIF-unknown.conf
 create mode 100644 ucm2/codecs/rt5640/EnableSeq-AIF1.conf
 create mode 100644 ucm2/codecs/rt5640/EnableSeq-AIF2.conf

-- 
2.30.1

