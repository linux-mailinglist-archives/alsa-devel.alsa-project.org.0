Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A489459DC5
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 09:21:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D145A1655;
	Tue, 23 Nov 2021 09:20:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D145A1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637655684;
	bh=1wPJuK/MRhvQFxtw44MDEir2V+UqnSCduBIwoSNnGHA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PHZaE4NVNu3sfbI03/qY/uCp/pLylgIZIQwgKAs6TLfXjqM0IKG7Xb29C8IaELBKL
	 gH5kNGBFYSJqFrMsqkg0b1x2NgJAS3OTEZvHRZqNi7ICrG66QwDoYam67dvBJNqXao
	 t2zXNE6W5emaA70lx67wfVgBYZLHaZMv4ZmxhOag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12319F804AB;
	Tue, 23 Nov 2021 09:20:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F6ECF8049E; Tue, 23 Nov 2021 09:20:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HELO_DYNAMIC_IPADDR,RDNS_DYNAMIC,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out203-205-221-240.mail.qq.com (out203-205-221-240.mail.qq.com
 [203.205.221.240])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FECEF80154
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 09:19:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FECEF80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com
 header.b="YwmyT7NC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1637655590;
 bh=qDkdMkuGmnqM0WTZI7gs3hWemJNyPIZq32ImyXmJdVs=;
 h=From:To:Cc:Subject:Date;
 b=YwmyT7NCXIBpgaPmjNRhgtpbGoZAzuM/6j99tZSTLq9utm9oAD06EyGgFlFkTuh74
 Yt4RVM0IYaY/rSYJ7X9eVCjK/muW9ww3yhLiNBTFHHAkC0g0ymavz5k3MLiPYE3+1N
 oBJZ0JY/Yo0LzLbsvSOauYOe5uhVHfMyB/l4F7Do=
Received: from localhost.localdomain ([106.37.198.34])
 by newxmesmtplogicsvrsza28.qq.com (NewEsmtp) with SMTP
 id 4E7B4A0C; Tue, 23 Nov 2021 16:19:39 +0800
X-QQ-mid: xmsmtpt1637655579t9yevkson
Message-ID: <tencent_E3D552E08140479185E91F9803CE3C6AFC09@qq.com>
X-QQ-XMAILINFO: MFViGQwD1A+rYjvabUgI3r5adOyL5YOIDx2TcPsGbPpmMFsC/5hRiq4uNPV0sW
 tQwCaRzAv+GAjgWh41P1Fk6yEYxEl6PsphIilnz36Dn3t25xspZADZt61YNPGNeUJvqPxyumAyo8
 Wu0a3CmtYjyFu7Y8afEiUIHUTA5BTvO+Slj0tEYUdpfegPv+DK1mJwmZvFV2lf5ew9AJKqAEdCQF
 6KzxFcRo6PJFfX+9IZ6XF2rEmKh+tbQZKb8q4op1jPD/CRMvCWgN04fWU82HrxcfI1A1WMOc4zWV
 7jyJSlJ+6hDaxIm/bcEyMWdpo2WDjG4DfSVs3yN59/fRdlhHLKq5MqXv28vxzyYh4QGOLZnowbeT
 R6So1sdwnUSuUCADznaeNihU1OCSGVI65UY5BbmErBhfqLTrUcGWJShqjuTGUCgaUWuI76WOosEf
 SZzUHngbypf+cXEliyR+B0vhHR+YLlNsCoGrN2Iv/sDqWPrrr0YoO7pAGnk0GFKOK6mzcA9zFu3S
 2sns2FK4eZPuI31RxF7Q92E1mv/V7+KDTO4ugq3PJQIui50iox/Jd6AMxO2KmI+3fmEzDbKW4mtr
 4WoSNosqta+cYsKGPYqtU3oxlvouWCtx/3kJk2FR4UlE6cIY6HHZgjlWCOcs1hM4P7S0w06Gkg8r
 RI5UXUzVS0PVe8kxWgEj7r3ZfgnCp8bJRK4P/74mT+ql2gHDsnnZavkXPBJqVvbS4pOcK0aegue8
 ufyS4LhT3WT719d6V34+1g7L1kTTFFeWhfXCOxLRrdSGCm2FeYKrQoax689fkH5QLAD9pxcN/oEJ
 eyrNgzrEiornnYsOqLQEom9ZtkNK7+5ik/XrMmkMSvZvt5c4IynRSfMqRkOG+jFukTEJpCWu9csV
 ninyY1UsjkYMDbj56yG0xFUuRXXq/1IQ==
From: tianyucode <tianyucode@foxmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/via - fix occasionally no sound with VT1802
Date: Tue, 23 Nov 2021 16:18:57 +0800
X-OQ-MSGID: <20211123081857.414213-1-tianyucode@foxmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tianyu <tianyu@kylinos.cn>
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

From: tianyu <tianyu@kylinos.cn>

Hi guys, I'm a new guy for audio driver.

I have encountered a problem. When using the VT1802 codec,
there will be no sound occasionally. After checking the initialization process,
I found that the cause of the problem is that the power state does not have
hda_set_power_state(codec, AC_PWRST_D0).

1. The power state is set to AC_PWRST_D0 during the first initialization：

azx_probe_continue
	azx_probe_codecs
		snd_hda_codec_new
			snd_hda_codec_device_new
				hda_set_power_state(codec, AC_PWRST_D0);

2. Then, the power state is set to AC_PWRST_D3 in VT1802, but not set in realtek (ALC269).

azx_probe_continue
	azx_codec_configure
		…
		patch_vt2002
			via_parse_auto_config
				snd_hda_gen_parse_auto_config
					add_all_pin_power_ctls
						add_pin_power_ctls
							set_path_power

static void add_all_pin_power_ctls(struct hda_codec *codec, bool on)
{
	/**/
	if (!codec->power_save_node)
		return;

	add_pin_power_ctls(codec, cfg->line_outs, cfg->line_out_pins, on);
	/**/
}

The power_save_node is set to 0 in patch_alc269 and it returns here,
but it is set to 1 in VT1802.

patch_vt2002P
	via_new_spec
		codec->power_save_node = 1;
	via_parse_auto_config
		snd_hda_gen_parse_auto_config
		codec->power_save_node = 0;//it set to 0 here,but add_all_pin_power_ctls has been done

patch_alc269
	codec->power_save_node = 0;

3. Next there is a suspend and resume process, the resume process will also set the
power state to AC_PWRST_D0, but I think there is a problem with this process.

(1)suspend:

azx_probe_continue
	snd_card_register
		..
		snd_hda_codec_dev_register
			snd_hda_codec_register
				snd_hda_power_down
					pm_runtime_put_autosuspend
					__pm_runtime_suspend(dev, RPM_GET_PUT | RPM_ASYNC | RPM_AUTO);
						rpm_suspend

static int rpm_suspend(struct device *dev, int rpmflags)
{
	/**/
	if (rpmflags & RPM_ASYNC) {
		dev->power.request = (rpmflags & RPM_AUTO) ?
		    RPM_REQ_AUTOSUSPEND : RPM_REQ_SUSPEND;
		if (!dev->power.request_pending) {
			dev->power.request_pending = true;
			queue_work(pm_wq, &dev->power.work);
		}
		goto out;
	}

	__update_runtime_status(dev, RPM_SUSPENDING);

	/**/
	retval = rpm_callback(callback, dev);
	__update_runtime_status(dev, RPM_SUSPENDED);
	/**/
}

The first call to rpm_suspend has the RPM_ASYNC flag, so queue_work is called,
and the work queue is used to enter rpm_suspend

pm_runtime_init
	INIT_WORK(&dev->power.work, pm_runtime_work);

(2)resume:

azx_probe_continue
	set_default_power_save
		snd_hda_set_power_save(&chip->bus, val * 1000);
			codec_set_power_save(c, delay);

int val = power_save;
static int power_save = CONFIG_SND_HDA_POWER_SAVE_DEFAULT;//It is 0 in my .config

static void codec_set_power_save(struct hda_codec *codec, int delay)
{
	struct device *dev = hda_codec_dev(codec);
	if (delay == 0 && codec->auto_runtime_pm)
		delay = 3000;

	if (delay > 0) {
		pm_runtime_set_autosuspend_delay(dev, delay);
		pm_runtime_use_autosuspend(dev);
		pm_runtime_allow(dev);
		if (!pm_runtime_suspended(dev))
			pm_runtime_mark_last_busy(dev);
	} else {
		pm_runtime_dont_use_autosuspend(dev);
		pm_runtime_forbid(dev);
	}
}

pm_runtime_forbid
	rpm_resume(dev, 0);

static int rpm_resume(struct device *dev, int rpmflags)
{
	/**/
	if (dev->power.runtime_status == RPM_ACTIVE) {
		retval = 1;
		goto out;
	}

	/**/
	_update_runtime_status(dev, RPM_RESUMING);
	retval = rpm_callback(callback, dev);
	/**/
	__update_runtime_status(dev, RPM_ACTIVE);
	/**/
}

The callback functions of suspend and resume are as follows, which set the power state:

hda_call_codec_suspend
	state = hda_set_power_state(codec, AC_PWRST_D3);

hda_call_codec_resume
	hda_set_power_state(codec, AC_PWRST_D0);

You can see that the resume function relies on dev->power.runtime_status,
and the status is set in rpm_suspend. The operation of rpm_suspend depends
on the scheduling of the work queue. I added print debugging on my machine,
and occasionally there will be pm_runtime_work in Run after rpm_resume.
At this time, the suspend and resume processes are not performed correctly.
In VT1802, the power_state is still D3, and the machine has no sound.

4. I searched the Internet and did not find the relevant modification,
but found the commit 317d9313925c (ALSA: hda/realtek-Set default power save node to 0).

Does VIA need to be modified like this?

Since I am not familiar with ALSA and runtime pm, so come here to consult.

---
 sound/pci/hda/patch_via.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_via.c b/sound/pci/hda/patch_via.c
index a29d7e989fe6..d01ea582cf25 100644
--- a/sound/pci/hda/patch_via.c
+++ b/sound/pci/hda/patch_via.c
@@ -1073,8 +1073,10 @@ static int patch_vt2002P(struct hda_codec *codec)
 	snd_hda_pick_fixup(codec, NULL, vt2002p_fixups, via_fixups);
 	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
 
-	if (spec->codec_type == VT1802)
+	if (spec->codec_type == VT1802) {
+		codec->power_save_node = 0;
 		err = snd_hda_add_verbs(codec, vt1802_init_verbs);
+	}
 	else
 		err = snd_hda_add_verbs(codec, vt2002P_init_verbs);
 	if (err < 0)
-- 
2.25.1

