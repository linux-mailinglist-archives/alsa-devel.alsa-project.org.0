Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D085492EA7
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jan 2022 20:46:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F4422D6B;
	Tue, 18 Jan 2022 20:45:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F4422D6B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642535170;
	bh=a+8nXEscwk5U+EQ/yHPI1AVDjSoeebuYi1TNm/r3MGM=;
	h=Date:To:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ja1K05+acGrglr3HkZGrd17dQ4cerpaPeSeEAetvqclQCF4SRedwsBaZme1Oy4+BA
	 4Jd2HhWcC5YnXh6GncXAq3XyTJFh9WbdaAjJ+IiUipq2qFsPZqT5KIsZmxeVtXYtmt
	 RUbZqsm+VP3BKBBhuUetOnriOmUJdZIEWDfRAArQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B21E5F80240;
	Tue, 18 Jan 2022 20:45:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C185F8023B; Tue, 18 Jan 2022 20:45:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=KHOP_HELO_FCRDNS, PRX_BODY_60, 
 SPF_HELO_NONE, SPF_NONE, UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay.hostedemail.com (relay027.a.hostedemail.com
 [64.99.140.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F578F80100
 for <alsa-devel@alsa-project.org>; Tue, 18 Jan 2022 20:44:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F578F80100
Received: from omf03.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay07.hostedemail.com (Postfix) with ESMTP id 6D3FC20942
 for <alsa-devel@alsa-project.org>; Tue, 18 Jan 2022 19:44:48 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: dag@bakke.com) by
 omf03.hostedemail.com (Postfix) with ESMTPA id B0E7B60011
 for <alsa-devel@alsa-project.org>; Tue, 18 Jan 2022 19:44:32 +0000 (UTC)
Message-ID: <c226039f-b756-8d45-6049-510f73230b66@bakke.com>
Date: Tue, 18 Jan 2022 20:44:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
To: ALSA development <alsa-devel@alsa-project.org>
Content-Language: en-US
From: Dag B <dag@bakke.com>
Subject: [PATCH, RFC] Enable S/PDIF output on Intel Hades Canyon NUC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Stat-Signature: j7qfyimqy6s1o4d4qoyayctjo7hb9h3m
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: B0E7B60011
X-Session-Marker: 6461674062616B6B652E636F6D
X-Session-ID: U2FsdGVkX18PdrjnQpoX9JnXUPzDlScfJXYQA+wotxM=
X-HE-Tag: 1642535072-392628
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

Hi.



The current snd-hda-intel/snd_hda_codec_realtek combo in the Linux kernel
does not appear to enable the S/PDIF (toslink, iec958) port on Intel's Hades
Canyon NUC. None of the current models/quirks changes this. To my knowledge.
(The physical port in question is a minijack/mini toslink combo port.)

I have found a number of people having  the same issue with S/PDIF under
Linux, on this particular hardware. None of these people reporting being
able to find a solution, apart from a warm reboot into Linux from Windows.
Until ...
https://www.insanelymac.com/?app=core&module=system&controller=content&do=find&content_class=forums_Topic&content_id=339291&content_commentid=2688953


So. cyber4o claims the BIOS is wrong, and came up with the patch=
solution first, then a modification to   sound/pci/hda/patch_realtek.c
to avoid having to boot to windows first. (IIUIC). I have been able to
employ this solution and get the optical output enabled.


I have (until now) used  model=dell-headset-multi  to enable my headphones
with (on-wire) microphone in the front jack. (Kudos to arch-linux docs)
The suggested fix for the missing optical out didn't cover headset config,
so some modifications were needed. I'll freely admit to have very limited
knowledge of what I am doing. Monkey see, monkey do.

Anyways: I took cyber4o's solution and chained in the dell-headset-multi
fixup. I now have optical output, my headset and on-wire microphone works.
My current patch is below, and is purely intended as an illustration of
how to make this work.

I would be very happy if someone with an actual clue took the
patch below and beat it into shape acceptable for inclusion in the kernel.
Reading the forum post above may be wise, in case I have missed something.


Some things which still make me scratch my head:
- There is a slider named 'Digital' in the 'Capture' tab of alsamixer.
   Not sure what it does.

- 'Headset Mic Boost', 'Headphone Mic Boost', 'Internal Mic Boost',
   'Internal Mic Boost 1' all appear in *both* the 'Playback' *and*
   'Capture' tabs of alsamixer. Is this on purpose? Bug in alsamixer?

- There is no 'Headset' output slider in the 'Playback' tab. I do have
   'Headphone' and 'Line out', though. And Mic boost for both headset and
   headphone. Not a problem, just ... 'asymmetrical'?

- Marketing materials name the jack in the rear as
   'Stereo headphones/TOSLINK combo rear jack'. Can we pretend it doesn't
   support a microphone (no idea...), and just name it (the copper
   bits) Line-Out? Less confusion? Again, really no clue about where these
   strings come from or what the 'correct' action is.

- Inserting the jack in the front does not automatically mute the (optical)
   output in the back. Independent of the Auto-Mute state. Unsure if this
   is a corner case not covered by current code or not. Auto-mute only
   offers Enabled/Disabled here. (And not  'Disabled', 'Speaker Only' and
   'Line-Out+Speaker'. I propose to mute S/PDIF together with Line Out.)


/lib/firmware/nuc.patch:   (loaded by patch= parameter to snd-hda-intel)

[codec]
0x10ec0700 0x80862073 0
  
[pincfg]
0x1e 0x03441060


--- patch_realtek.c.orig    2021-12-10 21:07:29.324951606 -0000
+++ patch_realtek.c    2021-12-14 10:23:18.452173524 -0000
@@ -4669,6 +4669,12 @@
      }
  }
  
+static void alc700_fixup_nuc_spdif(struct hda_codec *codec,
+                         const struct hda_fixup *fix, int action)
+{
+       snd_hda_override_wcaps(codec, 0x6, 0x611);
+}
+
  /* Line2 = mic mute hotkey
   * GPIO2 = mic mute LED
   */
@@ -6667,6 +6673,7 @@
      ALC225_FIXUP_DELL_WYSE_MIC_NO_PRESENCE,
      ALC225_FIXUP_S3_POP_NOISE,
      ALC700_FIXUP_INTEL_REFERENCE,
+    ALC700_FIXUP_NUC_SPDIF,
      ALC274_FIXUP_DELL_BIND_DACS,
      ALC274_FIXUP_DELL_AIO_LINEOUT_VERB,
      ALC298_FIXUP_TPT470_DOCK_FIX,
@@ -6975,6 +6982,12 @@
          .chained = true,
          .chain_id = ALC269_FIXUP_THINKPAD_ACPI,
      },
+        [ALC700_FIXUP_NUC_SPDIF] = {
+                .type = HDA_FIXUP_FUNC,
+                .v.func = alc700_fixup_nuc_spdif,
+        .chained = true,
+        .chain_id = ALC269_FIXUP_DELL1_MIC_NO_PRESENCE,
+        },
      [ALC269_FIXUP_DELL1_MIC_NO_PRESENCE] = {
          .type = HDA_FIXUP_PINS,
          .v.pins = (const struct hda_pintbl[]) {
@@ -8761,6 +8774,7 @@
      SND_PCI_QUIRK(0x10cf, 0x1757, "Lifebook E752", ALC269_FIXUP_LIFEBOOK_HP_PIN),
      SND_PCI_QUIRK(0x10cf, 0x1845, "Lifebook U904", ALC269_FIXUP_LIFEBOOK_EXTMIC),
      SND_PCI_QUIRK(0x10ec, 0x10f2, "Intel Reference board", ALC700_FIXUP_INTEL_REFERENCE),
+    SND_PCI_QUIRK(0x10ec, 0x2073, "Intel NUC8 Hades Canyon", ALC700_FIXUP_NUC_SPDIF),
      SND_PCI_QUIRK(0x10ec, 0x118c, "Medion EE4254 MD62100", ALC256_FIXUP_MEDION_HEADSET_NO_PRESENCE),
      SND_PCI_QUIRK(0x10ec, 0x1230, "Intel Reference board", ALC295_FIXUP_CHROME_BOOK),
      SND_PCI_QUIRK(0x10ec, 0x1252, "Intel Reference board", ALC295_FIXUP_CHROME_BOOK),
@@ -9024,6 +9038,7 @@
      {.id = ALC298_FIXUP_TPT470_DOCK, .name = "tpt470-dock"},
      {.id = ALC233_FIXUP_LENOVO_MULTI_CODECS, .name = "dual-codecs"},
      {.id = ALC700_FIXUP_INTEL_REFERENCE, .name = "alc700-ref"},
+    {.id = ALC700_FIXUP_NUC_SPDIF, .name = "nuc-hc"},
      {.id = ALC269_FIXUP_SONY_VAIO, .name = "vaio"},
      {.id = ALC269_FIXUP_DELL_M101Z, .name = "dell-m101z"},
      {.id = ALC269_FIXUP_ASUS_G73JW, .name = "asus-g73jw"},

