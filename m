Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAF3E8FBF
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Oct 2019 20:12:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7D4C226E;
	Tue, 29 Oct 2019 20:12:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7D4C226E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572376371;
	bh=bDWOP2vSAM1Bo1SwRCfpD5DDqhkUXBLVSZFu5yHNh1o=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tQ9JqyG6Vz4N9ZpWBjch7xKNUwL12Uf1+5mRePO0je1HTpj2uoEdWmXYc7i7JM81c
	 WaXOZIvSHP34vjkrvG7Xqj2v7cHZ7R99XvUz1a84dSkgt2v2ZohU6dqNS5plY8PXJt
	 dVXyYgrcy629RPwK0SAJ90uoGI0upSxH7NnsMio8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E006F80269;
	Tue, 29 Oct 2019 20:11:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DC69F803CF; Tue, 29 Oct 2019 20:11:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07440F80269
 for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2019 20:11:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07440F80269
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Oct 2019 12:10:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,245,1569308400"; d="scan'208";a="230179348"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 29 Oct 2019 12:10:50 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 29 Oct 2019 21:10:50 +0200
Date: Tue, 29 Oct 2019 21:10:50 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: alsa-devel@alsa-project.org
Message-ID: <20191029191050.GF1208@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>, intel-gfx@lists.freedesktop.org
Subject: [alsa-devel] pcm_lock deadlock
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Takashi,

I just got this deadlock when I tried to modprobe i915 on an ELK:

[  203.716416] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[  203.716417] WARNING: possible recursive locking detected
[  203.716418] 5.4.0-rc5-elk+ #206 Not tainted
[  203.716419] --------------------------------------------
[  203.716420] kworker/0:1/12 is trying to acquire lock:
[  203.716421] efb1c138 (&spec->pcm_lock){+.+.}, at: generic_hdmi_init+0x21=
/0x140 [snd_hda_codec_hdmi]
[  203.716426] =

               but task is already holding lock:
[  203.716427] efb1c138 (&spec->pcm_lock){+.+.}, at: check_presence_and_rep=
ort+0x67/0xb0 [snd_hda_codec_hdmi]
[  203.716430] =

               other info that might help us debug this:
[  203.716431]  Possible unsafe locking scenario:

[  203.716431]        CPU0
[  203.716432]        ----
[  203.716432]   lock(&spec->pcm_lock);
[  203.716433]   lock(&spec->pcm_lock);
[  203.716434] =

                *** DEADLOCK ***

[  203.716435]  May be due to missing lock nesting notation

[  203.716436] 3 locks held by kworker/0:1/12:
[  203.716436]  #0: f14096a0 ((wq_completion)events){+.+.}, at: process_one=
_work+0x1b8/0x530
[  203.716442]  #1: f14dbf4c ((work_completion)(&bus->unsol_work)){+.+.}, a=
t: process_one_work+0x1b8/0x530
[  203.716444]  #2: efb1c138 (&spec->pcm_lock){+.+.}, at: check_presence_an=
d_report+0x67/0xb0 [snd_hda_codec_hdmi]
[  203.716448] =

               stack backtrace:
[  203.716449] CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.4.0-rc5-elk+ =
#206
[  203.716450] Hardware name: System manufacturer P5Q-EM/P5Q-EM, BIOS 2203 =
   07/08/2009
[  203.716457] Workqueue: events snd_hdac_bus_process_unsol_events [snd_hda=
_core]
[  203.716459] Call Trace:
[  203.716463]  dump_stack+0x66/0x8e
[  203.716466]  __lock_acquire.cold.62+0x3bf/0x3c7
[  203.716468]  ? mark_held_locks+0x3f/0x60
[  203.716470]  ? _raw_spin_unlock_irq+0x22/0x30
[  203.716478]  ? azx_rirb_get_response+0xd7/0x220 [snd_hda_codec]
[  203.716479]  ? lockdep_hardirqs_on+0xec/0x1a0
[  203.716480]  ? _raw_spin_unlock_irq+0x22/0x30
[  203.716483]  ? trace_hardirqs_on+0x4a/0xf0
[  203.716484]  ? find_held_lock+0x26/0xb0
[  203.716486]  lock_acquire+0x74/0x150
[  203.716488]  ? generic_hdmi_init+0x21/0x140 [snd_hda_codec_hdmi]
[  203.716490]  __mutex_lock+0x60/0x810
[  203.716492]  ? generic_hdmi_init+0x21/0x140 [snd_hda_codec_hdmi]
[  203.716496]  ? snd_hdac_exec_verb+0x16/0x40 [snd_hda_core]
[  203.716499]  ? codec_read+0x29/0x40 [snd_hda_core]
[  203.716501]  mutex_lock_nested+0x14/0x20
[  203.716503]  ? generic_hdmi_init+0x21/0x140 [snd_hda_codec_hdmi]
[  203.716505]  generic_hdmi_init+0x21/0x140 [snd_hda_codec_hdmi]
[  203.716507]  generic_hdmi_resume+0x18/0x60 [snd_hda_codec_hdmi]
[  203.716512]  hda_call_codec_resume+0xc2/0x130 [snd_hda_codec]
[  203.716517]  hda_codec_runtime_resume+0x2a/0x60 [snd_hda_codec]
[  203.716520]  __rpm_callback+0x7a/0x140
[  203.716524]  ? snd_hda_codec_device_new+0x2a0/0x2a0 [snd_hda_codec]
[  203.716529]  ? snd_hda_codec_device_new+0x2a0/0x2a0 [snd_hda_codec]
[  203.716531]  rpm_callback+0x1a/0x70
[  203.716535]  ? snd_hda_codec_device_new+0x2a0/0x2a0 [snd_hda_codec]
[  203.716537]  rpm_resume+0x52c/0x700
[  203.716538]  ? _raw_spin_lock_irqsave+0x32/0x40
[  203.716540]  __pm_runtime_resume+0x43/0x90
[  203.716543]  snd_hdac_power_up_pm+0x4d/0x50 [snd_hda_core]
[  203.716546]  hdmi_present_sense+0x34/0x340 [snd_hda_codec_hdmi]
[  203.716548]  ? finish_task_switch+0x89/0x210
[  203.716550]  check_presence_and_report+0x7a/0xb0 [snd_hda_codec_hdmi]
[  203.716553]  hdmi_unsol_event+0x57/0x60 [snd_hda_codec_hdmi]
[  203.716557]  ? hda_codec_match+0x70/0x70 [snd_hda_codec]
[  203.716561]  hda_codec_unsol_event+0x12/0x20 [snd_hda_codec]
[  203.716564]  snd_hdac_bus_process_unsol_events+0x51/0x60 [snd_hda_core]
[  203.716566]  process_one_work+0x230/0x530
[  203.716567]  worker_thread+0x37/0x410
[  203.716569]  kthread+0xf5/0x110
[  203.716570]  ? process_one_work+0x530/0x530
[  203.716572]  ? kthread_create_worker_on_cpu+0x20/0x20
[  203.716574]  ret_from_fork+0x2e/0x38

Looks like commit ade49db337a9 ("ALSA: hda/hdmi - Allow audio
component for AMD/ATI and Nvidia HDMI") introduced pcm_lock
to generic_hdmi_init().

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
