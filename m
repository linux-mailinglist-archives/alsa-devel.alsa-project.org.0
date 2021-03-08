Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5734C331A02
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Mar 2021 23:10:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9EB418C9;
	Mon,  8 Mar 2021 23:09:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9EB418C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615241418;
	bh=x4+FgSssDE9BMSixTLrG+yhrTemcwYNtNGLNlESKGNI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GN7xsQDxvWhr+Tt3uBSii5+Ly7cx9/tpBHSyhdsQze2qMvnvY21IKg2GiQ7O0m8/l
	 LL1OAOdkjk6uATeH8ZNSYE7jPnlg21z3zktM7xh4DAEVCgzWKFpu1BrI0G0GbYE5rc
	 pTvuiSehcWonYjWdEKSgn0XaYTfjXHmjxczCwA9M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF5D7F804D1;
	Mon,  8 Mar 2021 23:06:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7863F8032C; Mon,  8 Mar 2021 23:06:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D8DCF80217
 for <alsa-devel@alsa-project.org>; Mon,  8 Mar 2021 23:06:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D8DCF80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Rm+aycLb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615241172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z0NdPACqB8ow7xOL5EC/vn8YKbEAliMiY/iewaHXPy4=;
 b=Rm+aycLbZRiUlIOkcPX2n4wAUXdT1SGrWJrsLQ9WjRgsX9kA+GBE1ihnBYPFkyag4IDmAx
 i0njPyhlNvvkf11BdFva+uzSWOuzRvym1Qlk5BhnzwaJZRXFyAVMNq6JilD1p3PWny+Ypx
 YBE/vXhmbZhQ0msxfqnbFSFIRg7rNeU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-Qfkis2H3NdyXDHDiKigvuA-1; Mon, 08 Mar 2021 17:06:08 -0500
X-MC-Unique: Qfkis2H3NdyXDHDiKigvuA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04B631018F64;
 Mon,  8 Mar 2021 22:06:07 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-114-220.ams2.redhat.com
 [10.36.114.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D47485D756;
 Mon,  8 Mar 2021 22:06:05 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH alsa-ucm-conf v2 7/7] codecs/rt5640: Specify
 Playback/CaptureMasterElem for HW volume-control
Date: Mon,  8 Mar 2021 23:05:54 +0100
Message-Id: <20210308220554.76111-8-hdegoede@redhat.com>
In-Reply-To: <20210308220554.76111-1-hdegoede@redhat.com>
References: <20210308220554.76111-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

Newer kernels add "aif:1" or "aif:2" to the components string to let
us know which AIF is being used.

Use this to specify the correct Playback/CaptureMasterElem for HW
volume-control, based on which AIF is being used.

On older kernels, where there is no "aif:%d" string in the components
string, no Playback/CaptureMasterElem is specified.

In DigitalMics.conf the master mixer is used as regular CaptureMixerElem
instead of as CaptureMasterElem since the DMICs don't have any analog
volume control.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 ucm2/bytcr-rt5640/HiFi.conf             | 21 +++++++++++++++++++++
 ucm2/codecs/rt5640/DigitalMics.conf     | 16 ++++++++++++++++
 ucm2/codecs/rt5640/HeadPhones.conf      | 12 ++++++++++++
 ucm2/codecs/rt5640/HeadsetMic.conf      | 12 ++++++++++++
 ucm2/codecs/rt5640/IN1-InternalMic.conf | 12 ++++++++++++
 ucm2/codecs/rt5640/IN3-InternalMic.conf | 12 ++++++++++++
 ucm2/codecs/rt5640/MonoSpeaker.conf     | 12 ++++++++++++
 ucm2/codecs/rt5640/Speaker.conf         | 12 ++++++++++++
 8 files changed, 109 insertions(+)

diff --git a/ucm2/bytcr-rt5640/HiFi.conf b/ucm2/bytcr-rt5640/HiFi.conf
index a5c05ba..7d504d1 100644
--- a/ucm2/bytcr-rt5640/HiFi.conf
+++ b/ucm2/bytcr-rt5640/HiFi.conf
@@ -1,5 +1,26 @@
 # Use case Configuration for bytcr-rt5640
 
+Define.HaveAif1 ""
+Define.HaveAif2 ""
+
+If.DefineAif1 {
+	Condition {
+		Type String
+		Haystack "${CardComponents}"
+		Needle "aif:1"
+	}
+	True.Define.HaveAif1 "yes"
+}
+
+If.DefineAif2 {
+	Condition {
+		Type String
+		Haystack "${CardComponents}"
+		Needle "aif:2"
+	}
+	True.Define.HaveAif2 "yes"
+}
+
 SectionVerb {
 	Include.e.File "/codecs/rt5640/EnableSeq.conf"
 
diff --git a/ucm2/codecs/rt5640/DigitalMics.conf b/ucm2/codecs/rt5640/DigitalMics.conf
index 157c544..032d954 100644
--- a/ucm2/codecs/rt5640/DigitalMics.conf
+++ b/ucm2/codecs/rt5640/DigitalMics.conf
@@ -26,5 +26,21 @@ SectionDevice."Mic" {
 	Value {
 		CapturePriority 100
 		CapturePCM "hw:${CardId}"
+		If.DmicAif1 {
+			Condition { Type String Empty "${var:HaveAif1}" }
+			False {
+				CaptureMixerElem "ADC"
+				CaptureVolume "ADC Capture Volume"
+				CaptureSwitch "ADC Capture Switch"
+			}
+		}
+		If.DmicAif2 {
+			Condition { Type String Empty "${var:HaveAif2}" }
+			False {
+				CaptureMixerElem "Mono ADC"
+				CaptureVolume "Mono ADC Capture Volume"
+				CaptureSwitch "Mono ADC Capture Switch"
+			}
+		}
 	}
 }
diff --git a/ucm2/codecs/rt5640/HeadPhones.conf b/ucm2/codecs/rt5640/HeadPhones.conf
index 5535111..4fbe95d 100644
--- a/ucm2/codecs/rt5640/HeadPhones.conf
+++ b/ucm2/codecs/rt5640/HeadPhones.conf
@@ -37,5 +37,17 @@ SectionDevice."Headphones" {
 		JackControl "Headphone Jack"
 		PlaybackMixerElem "HP"
 		PlaybackVolume "HP Playback Volume"
+		If.HpAif1 {
+			Condition { Type String Empty "${var:HaveAif1}" }
+			False {
+				PlaybackMasterElem "DAC1"
+			}
+		}
+		If.HpAif2 {
+			Condition { Type String Empty "${var:HaveAif2}" }
+			False {
+				PlaybackMasterElem "DAC2"
+			}
+		}
 	}
 }
diff --git a/ucm2/codecs/rt5640/HeadsetMic.conf b/ucm2/codecs/rt5640/HeadsetMic.conf
index 8479672..b49dad4 100644
--- a/ucm2/codecs/rt5640/HeadsetMic.conf
+++ b/ucm2/codecs/rt5640/HeadsetMic.conf
@@ -43,5 +43,17 @@ SectionDevice."Headset" {
 		JackControl "Headset Mic Jack"
 		CaptureMixerElem "IN2 Boost"
 		CaptureVolume "IN2 Boost"
+		If.HSmicAif1 {
+			Condition { Type String Empty "${var:HaveAif1}" }
+			False {
+				CaptureMasterElem "ADC"
+			}
+		}
+		If.HSmicAif2 {
+			Condition { Type String Empty "${var:HaveAif2}" }
+			False {
+				CaptureMasterElem "Mono ADC"
+			}
+		}
 	}
 }
diff --git a/ucm2/codecs/rt5640/IN1-InternalMic.conf b/ucm2/codecs/rt5640/IN1-InternalMic.conf
index a317388..d670484 100644
--- a/ucm2/codecs/rt5640/IN1-InternalMic.conf
+++ b/ucm2/codecs/rt5640/IN1-InternalMic.conf
@@ -34,5 +34,17 @@ SectionDevice."Mic" {
 		CapturePCM "hw:${CardId}"
 		CaptureMixerElem "IN1 Boost"
 		CaptureVolume "IN1 Boost"
+		If.In1Aif1 {
+			Condition { Type String Empty "${var:HaveAif1}" }
+			False {
+				CaptureMasterElem "ADC"
+			}
+		}
+		If.In1Aif2 {
+			Condition { Type String Empty "${var:HaveAif2}" }
+			False {
+				CaptureMasterElem "Mono ADC"
+			}
+		}
 	}
 }
diff --git a/ucm2/codecs/rt5640/IN3-InternalMic.conf b/ucm2/codecs/rt5640/IN3-InternalMic.conf
index ef4eaba..345db1e 100644
--- a/ucm2/codecs/rt5640/IN3-InternalMic.conf
+++ b/ucm2/codecs/rt5640/IN3-InternalMic.conf
@@ -34,5 +34,17 @@ SectionDevice."Mic" {
 		CapturePCM "hw:${CardId}"
 		CaptureMixerElem "IN3 Boost"
 		CaptureVolume "IN3 Boost"
+		If.In3Aif1 {
+			Condition { Type String Empty "${var:HaveAif1}" }
+			False {
+				CaptureMasterElem "ADC"
+			}
+		}
+		If.In3Aif2 {
+			Condition { Type String Empty "${var:HaveAif2}" }
+			False {
+				CaptureMasterElem "Mono ADC"
+			}
+		}
 	}
 }
diff --git a/ucm2/codecs/rt5640/MonoSpeaker.conf b/ucm2/codecs/rt5640/MonoSpeaker.conf
index 3cbeafd..addaddd 100644
--- a/ucm2/codecs/rt5640/MonoSpeaker.conf
+++ b/ucm2/codecs/rt5640/MonoSpeaker.conf
@@ -31,5 +31,17 @@ SectionDevice."Speaker" {
 		PlaybackPCM "hw:${CardId}"
 		PlaybackMixerElem "Speaker"
 		PlaybackVolume "Speaker Playback Volume"
+		If.MonoSpkAif1 {
+			Condition { Type String Empty "${var:HaveAif1}" }
+			False {
+				PlaybackMasterElem "DAC1"
+			}
+		}
+		If.MonoSpkAif2 {
+			Condition { Type String Empty "${var:HaveAif2}" }
+			False {
+				PlaybackMasterElem "DAC2"
+			}
+		}
 	}
 }
diff --git a/ucm2/codecs/rt5640/Speaker.conf b/ucm2/codecs/rt5640/Speaker.conf
index 0924f9c..e7ff673 100644
--- a/ucm2/codecs/rt5640/Speaker.conf
+++ b/ucm2/codecs/rt5640/Speaker.conf
@@ -31,5 +31,17 @@ SectionDevice."Speaker" {
 		PlaybackPCM "hw:${CardId}"
 		PlaybackMixerElem "Speaker"
 		PlaybackVolume "Speaker Playback Volume"
+		If.SpkAif1 {
+			Condition { Type String Empty "${var:HaveAif1}" }
+			False {
+				PlaybackMasterElem "DAC1"
+			}
+		}
+		If.SpkAif2 {
+			Condition { Type String Empty "${var:HaveAif2}" }
+			False {
+				PlaybackMasterElem "DAC2"
+			}
+		}
 	}
 }
-- 
2.30.1

