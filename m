Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D6E6672F9
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Jan 2023 14:13:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 877DF8E46;
	Thu, 12 Jan 2023 14:12:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 877DF8E46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673529211;
	bh=zNCyUB8IygCoX91+kR/VDkps5yL+dHwC6lvPRwByyeg=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=clAGZmV40vARDUZ0Bhenld4WJgOYwDN1ZrtsL0XIUMk/NHSqCoNtzxzkmIzvEpKdo
	 H+nyrx/vvDC537lTDoxYFH151KWqjlYGZvghdzBRSsOvE2adFIMxgliaX9DtjQ54tH
	 omcDOCCi2HIFfEdojIRAUaMFZRLDkVEFlLKqXfb0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95E0DF804CA;
	Thu, 12 Jan 2023 14:12:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E81DF804C1; Thu, 12 Jan 2023 14:12:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC1D0F8019B;
 Thu, 12 Jan 2023 14:12:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC1D0F8019B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=jwdlxdoH
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A5C766602DB1;
 Thu, 12 Jan 2023 13:12:28 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1673529149;
 bh=zNCyUB8IygCoX91+kR/VDkps5yL+dHwC6lvPRwByyeg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jwdlxdoHAGabMlX51D0gKMZXVW/wxZl5Y8vv7MwLUAEiwbMIYIStZsmOiRgcel4w7
 QOqL8AMNoZg+4QV42+ctU59QFjDAnjKJ5RQV9ZDlH6yrQKFJVsLOo0AiZoBEOgYdpY
 UDtqMq6km8gwb2s+PYWv3Asq+ot2vCS+1XcGUg7yJY5H2947R7m2bNzlK8gUVj2wan
 QIyDQrwLpDrtokgI22vMHnfyqwcOcWMi8YdG2QnGzljuOH250gB2116/YQk7++SKrC
 cXcOtcPzndnM/1NmGuGeCdroAH6cT/2n99dLAjoTSAUopBE7JsRRMaIFOc82OL3mSi
 NfSLV90q4vdHQ==
Message-ID: <394ec60d-33c0-1386-9445-eb0c596cc46c@collabora.com>
Date: Thu, 12 Jan 2023 14:12:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] ASoC: SOF: sof-audio: Check snd_sof_widget pointer not
 NULL
To: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 pierre-louis.bossart@linux.intel.com
References: <20230112104542.115151-1-angelogioacchino.delregno@collabora.com>
 <ec65c3dc-135d-afbc-3f26-a28a2da791f7@linux.intel.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <ec65c3dc-135d-afbc-3f26-a28a2da791f7@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, kernel@collabora.com,
 kai.vehmanen@linux.intel.com, rander.wang@intel.com,
 yung-chuan.liao@linux.intel.com, tiwai@suse.com, lgirdwood@gmail.com,
 ranjani.sridharan@linux.intel.com, broonie@kernel.org, wenst@chromium.org,
 daniel.baluta@nxp.com, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Il 12/01/23 14:02, Péter Ujfalusi ha scritto:
> Hi Angelo,
> 
> On 12/01/2023 12:45, AngeloGioacchino Del Regno wrote:
>> In function sof_unprepare_widgets_in_path(), check if swidget is
>> actually not NULL, as the widget may not have been initialized at all.
>>
>> This commit solves the following kernel panic seen on MediaTek MT8195:
>>
>> [   18.025215] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000014
>> [   18.034266] Mem abort info:
>> [   18.037314]   ESR = 0x0000000096000004
>> [   18.041314]   EC = 0x25: DABT (current EL), IL = 32 bits
>> [   18.046876]   SET = 0, FnV = 0
>> [   18.050180]   EA = 0, S1PTW = 0
>> [   18.053572]   FSC = 0x04: level 0 translation fault
>> [   18.058700] Data abort info:
>> [   18.061832]   ISV = 0, ISS = 0x00000004
>> [   18.065919]   CM = 0, WnR = 0
>> [   18.069137] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000115495000
>> [   18.075826] [0000000000000014] pgd=0000000000000000, p4d=0000000000000000
>> [   18.082867] Internal error: Oops: 0000000096000004 [#1] SMP
>> [   18.088688] Modules linked in: af_alg qrtr btusb btrtl btintel btmtk btbcm bluetooth 8021q garp uvcvideo mrp stp ecdh_generic llc ecc videobuf2_vmalloc mt7921e mt7921_common mt76_connac_lib mt76 mac80211 snd_sof_ipc_msg_injector snd_sof_ipc_flood_test cfg80211 snd_sof_mt8195 mtk_adsp_common snd_sof_xtensa_dsp snd_sof_of panfrost rfkill snd_sof crct10dif_ce cros_ec_sensors cros_ec_lid_angle gpu_sched sbs_battery cros_usbpd_logger cros_ec_sensors_core hid_multitouch snd_sof_utils fuse ipv6
>> [   18.132109] CPU: 5 PID: 657 Comm: wireplumber Tainted: G        W          6.2.0-rc3-next-20230111+ #230
>> [   18.141834] Hardware name: Acer Tomato (rev2) board (DT)
>> [   18.147392] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> [   18.154600] pc : sof_unprepare_widgets_in_path.isra.0+0x28/0x10c [snd_sof]
>> [   18.161735] lr : sof_walk_widgets_in_order+0x198/0x1d0 [snd_sof]
>> [   18.167996] sp : ffff80000eb0b870
>> [   18.171558] x29: ffff80000eb0b870 x28: 0000000000000001 x27: ffff5d8e178c4c00
>> [   18.178939] x26: ffffbd50140fd758 x25: ffffbd50140fd760 x24: 0000000000000000
>> [   18.186321] x23: 0000000000000000 x22: ffff5d8e109dd080 x21: ffff5d8e0a429280
>> [   18.193702] x20: 0000000000000000 x19: ffff5d8e11fe4800 x18: 0000000000000000
>> [   18.201083] x17: 0000000000000000 x16: ffffbd5073deabb0 x15: 0000000000000000
>> [   18.208464] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
>> [   18.215846] x11: 0000000000000000 x10: 0000000000002780 x9 : ffffbd50140eb4bc
>> [   18.223228] x8 : ffff5d8e1b5327e0 x7 : 0000000000000000 x6 : ffff5d8e1b530000
>> [   18.230610] x5 : 0000000000000003 x4 : 0000000000000001 x3 : 0000000000000000
>> [   18.237991] x2 : 0000000000000000 x1 : ffff5d8e11fe4800 x0 : ffff5d8e0a429280
>> [   18.245372] Call trace:
>> [   18.248066]  sof_unprepare_widgets_in_path.isra.0+0x28/0x10c [snd_sof]
>> [   18.254847]  sof_walk_widgets_in_order+0x198/0x1d0 [snd_sof]
>> [   18.260760]  sof_widget_list_free+0x7c/0xbc [snd_sof]
>> [   18.266066]  sof_pcm_hw_free+0x10c/0x1c0 [snd_sof]
>> [   18.271110]  snd_soc_pcm_component_hw_free+0x8c/0xe0
>> [   18.276327]  soc_pcm_hw_clean+0x60/0x11c
>> [   18.280498]  dpcm_fe_dai_hw_free+0x98/0x110
>> [   18.284930]  snd_pcm_common_ioctl+0xc48/0x1a2c
>> [   18.289624]  snd_pcm_ioctl+0x38/0x50
>> [   18.293448]  __arm64_sys_ioctl+0xb0/0xf4
>> [   18.297620]  invoke_syscall+0x50/0x120
>> [   18.301618]  el0_svc_common.constprop.0+0x17c/0x1b0
>> [   18.306744]  do_el0_svc+0x40/0xc4
>> [   18.310307]  el0_svc+0x48/0xf0
>> [   18.313611]  el0t_64_sync_handler+0xb8/0xc0
>> [   18.318041]  el0t_64_sync+0x1a0/0x1a4
>> [   18.321953] Code: aa0103f3 f90013f5 aa0003f5 f9406834 (39405280)
>> [   18.328293] ---[ end trace 0000000000000000 ]---
>>
>> Fixes: 9862dcf70245 ("ASoC: SOF: don't unprepare widget used other pipelines")
>> Fixes: ce59804d2643 ("ASoC: SOF: clear prepare state when widget is unprepared")
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   sound/soc/sof/sof-audio.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
>> index e1ab8380e7d8..1988717762b3 100644
>> --- a/sound/soc/sof/sof-audio.c
>> +++ b/sound/soc/sof/sof-audio.c
>> @@ -274,7 +274,7 @@ sof_unprepare_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widg
>>   	struct snd_soc_dapm_path *p;
>>   
>>   	/* return if the widget is in use or if it is already unprepared */
>> -	if (!swidget->prepared || swidget->use_count > 1)
>> +	if (!swidget || !swidget->prepared || swidget->use_count > 1)
>>   		return;
> 
> we actually have a pending patch for upstream which did not yet made it
> to the gate:
> https://github.com/thesofproject/linux/commit/922646d533100044d95a050b222533d59f06020c
> 
> It also adds symmetrical check for the prepare path.
> 
> Would you be OK if I send that right away to replace your fix?
> 

I didn't know that you had something similar - I've been carrying this patch
locally for ~1.5 months, thinking that it was an issue with MediaTek drivers...
...but after investigating a bit (read: after I've found some time to actually
investigate), it really looked like a more generic issue - for which reason
I decided to send this patch upstream.


Speaking of your patch:
I think that the check that you've added to sof_prepare_widgets_in_path() will
never trigger... at least, it's never been the case here, but that may be a
platform-specific thing (even though I also have virtual widgets on MTK).
Also, your patch misses the Fixes tags (and this fix shall be backported).

Finally, I'd be OK with that if:
1. You add the Fixes tag for backporting; and
2. Describe why the swidget NULL check is required in sof_prepare_widgets_in_path()
    and why the legacy HDA machine driver would call that function with NULL swidget
    as that looks like a HDA driver bug, rather than a SOF core bug.

Regards,
Angelo


