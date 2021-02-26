Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C01A33264DE
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Feb 2021 16:44:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C76B168A;
	Fri, 26 Feb 2021 16:44:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C76B168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614354292;
	bh=B4SerikZIYIDN9DH7hGg9RfkCUEIzaDTN8ksanp2m+E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k7oww8tckvG87/vWpWUWqKmLhGrDiVW5Xgam/nubRzjDHvMAZ3fZNORvRKDF8zb3i
	 q+XhY1Q3mAAj1EaV9zE9J+kEHY1FYfxvfQX4OaQrPSDeFbr8PEKth/fSRPSDHqgzx/
	 k05YEe3xvNTlMSFqcbF4Str5ii5yW+ve5KggeU7Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4119EF804B1;
	Fri, 26 Feb 2021 16:40:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDE1FF8032C; Fri, 26 Feb 2021 16:40:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A10D9F802A9
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 16:40:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A10D9F802A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Z6Zu/x3y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614354042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hAhBm5qYE5wgDoNiAgOSUE+Cs3ybfhvyiXwU3Ge5IRk=;
 b=Z6Zu/x3y2ibmNJJHJ/5pS49+uopAwcO1Ag0CKFPPgzlJtKls6ySgJd7N/vLjBpIzM0P0xP
 IpOTwmjrzokWnT2YLqaa7L04iLT/huTvXGwq6qTTgHPK+/cOklvFOsY7AX/ZXT/9bR5S8S
 Tafc70QfwQPMIkNCE0uk1/xP8YgA6xw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-kh2lT7j1MGeQyHNterDaWA-1; Fri, 26 Feb 2021 10:40:41 -0500
X-MC-Unique: kh2lT7j1MGeQyHNterDaWA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1B3A100A614;
 Fri, 26 Feb 2021 15:40:39 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-36.ams2.redhat.com [10.36.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ADEC8163D5;
 Fri, 26 Feb 2021 15:40:38 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH alsa-ucm-conf 8/8] codecs/rt5640: Specify
 Playback/CaptureMasterElem for HW volume-control
Date: Fri, 26 Feb 2021 16:40:25 +0100
Message-Id: <20210226154025.84828-9-hdegoede@redhat.com>
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

Specify the correct Playback/CaptureMasterElem for HW volume-control,
based on which AIF is being used.

On older kernels, where there is no "aif:%d" string in the components
string, no Playback/CaptureMasterElem is specified.

In DigitalMics.conf the master mixer is used as regular CaptureMixerElem
instead of as CaptureMasterElem since the DMICs don't have any analog
volume control.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 ucm2/codecs/rt5640/DigitalMics.conf     | 16 ++++++++++++++++
 ucm2/codecs/rt5640/HeadPhones.conf      | 12 ++++++++++++
 ucm2/codecs/rt5640/HeadsetMic.conf      | 12 ++++++++++++
 ucm2/codecs/rt5640/IN1-InternalMic.conf | 12 ++++++++++++
 ucm2/codecs/rt5640/IN3-InternalMic.conf | 12 ++++++++++++
 ucm2/codecs/rt5640/MonoSpeaker.conf     | 12 ++++++++++++
 ucm2/codecs/rt5640/Speaker.conf         | 12 ++++++++++++
 7 files changed, 88 insertions(+)

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

