Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4BA35A066
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Apr 2021 15:56:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92598166C;
	Fri,  9 Apr 2021 15:55:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92598166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617976572;
	bh=LxlR2/iX/OrnHFmd2NezAZhCpxfoeWkv7pMOQThrZQA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sxWIPcLqnNvzA5GbYhjQsKf39ltVVpYmWne74ZfO9fIU+bATDWtvkaLY5dsi1ZLhL
	 Hbn4ISNDh5+Ud0Ct6KOcV5JAyh1K3y1Ah5oN3oZUJLE5K245G0SZb48t0r65fJzxc2
	 SKEwL98yoeUpqgKfiDKCBx+2QRTZ+s6YnPkvYmQY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D61FBF80113;
	Fri,  9 Apr 2021 15:54:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE774F8016A; Fri,  9 Apr 2021 15:54:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A314CF80162
 for <alsa-devel@alsa-project.org>; Fri,  9 Apr 2021 15:54:32 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 996DBA0040;
 Fri,  9 Apr 2021 15:54:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 996DBA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1617976471; bh=o5Ah5egMUxBsQnDlfOzuzGHoP6I2zLKy7XN+IJybk5U=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=e2qO+maQoTdrhVS1Pcl9GWlEHbMoxyY1wOiwq94Wrwg8HFxj1ZZBmzzTGzg3LCEvA
 jTi8Vymo7GlsxYtaUEMJSfO4q7zhCLVjceqSv+2u5BNqEwI+i/S5JWsdpYicIsOPG3
 H4VLqGj0cc9Cq9OHFfw+7AQeHs7OqBHYFQVss8Ig=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri,  9 Apr 2021 15:54:26 +0200 (CEST)
Subject: Re: [PATCH] ALSA: core - add more card sysfs entries
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Takashi Iwai <tiwai@suse.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20210408094314.1322802-1-perex@perex.cz>
 <20210408103819.GA40407@workstation> <s5h35w182a5.wl-tiwai@suse.de>
 <45acc908-3603-3479-9fb2-5206339a9ace@perex.cz>
 <20210408120502.GA4516@sirena.org.uk> <s5hpmz47w3i.wl-tiwai@suse.de>
 <56c874ae-e801-63df-19fa-a1325f6104ca@perex.cz>
 <3107db1d-f97d-539a-05db-6f880b762f00@linux.intel.com>
 <3b33595e-777c-90b2-6d65-346c9bf6e003@perex.cz>
 <b0258a67-79ca-50cd-e6c5-74514ba8a3c5@linux.intel.com>
 <s5hv98v6h5a.wl-tiwai@suse.de>
 <9195f83a-28c4-d028-8f1e-c3beaa88d891@perex.cz>
 <05551192-57dd-2541-94a3-57d40a37e3bf@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <397af8c4-0cd8-f63f-7ca8-4c10909e922a@perex.cz>
Date: Fri, 9 Apr 2021 15:54:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <05551192-57dd-2541-94a3-57d40a37e3bf@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>
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

Dne 09. 04. 21 v 11:09 Amadeusz Sławiński napsal(a):
> On 4/9/2021 10:34 AM, Jaroslav Kysela wrote:
>> Dne 09. 04. 21 v 9:39 Takashi Iwai napsal(a):
>>> On Thu, 08 Apr 2021 20:51:41 +0200,
>>> Pierre-Louis Bossart wrote:
>>>>
>>>>
>>>>
>>>>>>> When we have a common standard layer for the plug-and-play handling (udev), we
>>>>>>> should concentrate to allow changing / refining of this information there.
>>>>>>> Those strings are not used for anything else than the user space. So from my
>>>>>>> view, there's no reason to create another mechanism to handle the overrides.
>>>>>>> It should be a safe, fast, flexible and_optional_  solution. The udev can
>>>>>>> alter the sysfs attributes directly without any hassle with the file
>>>>>>> modifications or looking for another way to pass / store this information
>>>>>>> somewhere.
>>>>>>
>>>>>> There's one part where I am lost.
>>>>>>
>>>>>> The initial idea of udev what to modify kernel parameters to pick a
>>>>>> different path for firmware/topology before probing the PCI driver. At
>>>>>
>>>>> This may be a problematic point. The kernel cmdline cannot be modified from
>>>>> udev (as far as I know). The module parameters can be set using modprobe's
>>>>> config files or when loaded with sysfs attributes (/sys/module/*/parameters).
>>>>> Eventually, you can call the modprobe command with custom module parameters
>>>>> when the appropriate MODALIAS is probed.
>>>>>
>>>>> Perhaps, I'm missing something here, too. Some example udev rules may help.
>>>>
>>>> see the example shared by Curtis
>>>>
>>>> SUBSYSTEM=="pci", ATTR{vendor}=="0x8086", ATTR{device}=="0xa0c8",
>>>> ATTR{class}=="0x040100", ATTRS{[dmi/id]board_name}=="Eldrid",
>>>> RUN+="/sbin/modprobe snd_sof_pci tplg_path=intel/sof-tplg/pdm1"
>>>>
>>>> Those 'path' parameters would have to be set prior to creating the
>>>> card, making them writable via sysfs would not work, the firmware and
>>>> topology are already loaded and changing the paths would have no
>>>> effect.
>>>
>>> Couldn't the driver probe the firmware files with some device-specific
>>> string suffix at first?  e.g. the driver can issue request_firmware()
>>> with $base_file-$dmi_board at first, then falls back to the generic
>>> $base_file.  A similar method was already used in Broadcom WiFi
>>> driver.
>>>
>>> Also, the driver may do request_firmware() with a fixed path for the
>>> custom firmware at first (e.g. "intel/sof-tplg-custom"); then a system
>>> integrator may set up a specific configuration even that doesn't match
>>> with DMI or whatever identifier.
>>
>> And when we have two firmware files which differs just by functionality
>> requested by user? Although your method will work, I won't close the
>> possibility to configure everything in udev rather using a hard coded fw load
>> scheme only.
>>
>> 						Jaroslav
>>
> 
> I've slept on it and now I think I see what you are trying to do.
> 
> 1. Load FW dependent on platform/user settings
> 2. Load appropriate topology for FW
> 3. Have UCM for the FEs and controls exposed by driver
> 
> 
> As for 1. I would say that FW should be loaded from one location
> if there is some platform that requires special FW just add quirks, like 
> it is done with every other driver, and if someone wants to build their 
> own special FW, they just replace it. We can't possibly support hundreds 
> of possible FW modifications if users want them by putting them in 
> separate files. Alternatively allow override via kernel parameters.
> Overriding FW files via udev would only make sense to me if it was 
> possible to upload new FW at runtime.
> 
> I would say that same applies for 2.
> 
> This leaves number 3. which would require kernel exposing some kind of 
> information about loaded topology, so user space can use proper UCM.
> In topology manifest there are few reserved fields 
> (https://elixir.bootlin.com/linux/latest/source/include/uapi/sound/asoc.h#L382), 
> so we can add some information there which should be unique per topology 
> and then expose it in userspace on topology load, it can be the name of 
> UCM file topology wants to be loaded for example.
> 
> For example do something along those lines:
> 
> struct snd_soc_tplg_manifest {
> 	__le32 size;		/* in bytes of this structure */
> 	__le32 control_elems;	/* number of control elements */
> 	__le32 widget_elems;	/* number of widget elements */
> 	__le32 graph_elems;	/* number of graph elements */
> 	__le32 pcm_elems;	/* number of PCM elements */
> 	__le32 dai_link_elems;	/* number of DAI link elements */
> 	__le32 dai_elems;	/* number of physical DAI elements */
> 	__le32 ucm_files;	/* UCM files to use with topology */
> 	__le32 reserved[19];	/* reserved for new ABI element types */
> 	struct snd_soc_tplg_private priv;
> } __attribute__((packed));
> 
> struct snd_soc_tplg_ucm_files {
> 	struct snd_soc_tplg_ctl_hdr hdr;
> 	__le32 size;	/* size of struct in bytes */
> 	__le32 count;	/* UCM entries */
> 	char ucms[SNDRV_CTL_ELEM_ID_NAME_MAXLEN][];
> }
> 
> And then expose it somewhere under sysfs after parsing topology.

If the driver exports some extra information via sysfs, it can be already used
in the current UCM configs. I welcome any of this activity. It may ease
things. But it's a complement to my proposal to allow modify the sound card
identification in udev (not only for UCM). I believe that we can support
multiple ways and it's up to the maintainer / user of the specific distro to
select any.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
