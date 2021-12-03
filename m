Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 450584679ED
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Dec 2021 16:02:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E10B92353;
	Fri,  3 Dec 2021 16:02:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E10B92353
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638543772;
	bh=fYkiPLxHzavl1e1GprXZ0xF8n6L49oOOkJFnLJSLNG8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LjqEk31p0LraPODl7/vnNlOMI2j45A2llBdlEMB3KHznq3j/iky8uhidbjJryZVSd
	 poIq5V4DA1EG4dhj6BP++zL7/c8nMQQhnvcFLuV8oOMAkB8QEJ+2DFJQFMxY3z1Fk8
	 L52YaPtur+tQe3Y3ks1RkvE5YCtNzW5UzaCArnrU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 744ACF800A7;
	Fri,  3 Dec 2021 16:01:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADDC8F80246; Fri,  3 Dec 2021 16:01:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4510BF800A7
 for <alsa-devel@alsa-project.org>; Fri,  3 Dec 2021 16:01:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4510BF800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="tEJIoVoW"
Received: from [172.16.4.185] (unknown [119.41.208.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 58DA83F17A; 
 Fri,  3 Dec 2021 15:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1638543683;
 bh=/lDkRqJ88v1ucIBzuuXygaFN6pRVMaJgpbg5q1N0Pf4=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=tEJIoVoWvd8w81B10BiVIAwIpQ5v21B1QEE10VfAPXH6BL9fZ9GwGL/wJi/QZT9J4
 BVIt6IIIdZvTq6IAKHvykkFgbf9AIhnn23kfLw7kuQx3BaDv+u1o78rtTeUrCwWCHL
 GcGZ0YHq0sW2BiRJhqOX3mXloF+VDMQboEmKSwZGCvJGeyxaVQUvobjlWAT/G/0ZYR
 GckJ24zwy+zW7Kx5x3j4f4URISfULpWA5Kw2GN3BnkETsX9JKXAzm8VRnDeRhHacoU
 S5BtAeMpnx8clHGDUFiFGq8qOODBnQlMQLUVSyyXpB1bjnot0o1gG1a0z9DTtWGbHy
 XqFFEnFAA27xg==
Subject: Re: [linux-next:master 3956/5128]
 sound/soc/sof/intel/hda-codec.c:132:35: error: use of undeclared identifier
 'CODEC_PROBE_RETRIES'
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <202112031943.Twg19fWT-lkp@intel.com>
 <a93302d2-d76f-95a2-2a7c-bcf34db7bfd6@linux.intel.com>
 <alpine.DEB.2.22.394.2112031605380.3554566@eliteleevi.tm.intel.com>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <fb005aad-f535-e543-af04-2521f064b42d@canonical.com>
Date: Fri, 3 Dec 2021 23:01:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2112031605380.3554566@eliteleevi.tm.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, kbuild-all@lists.01.org,
 kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bard.liao@intel.com>
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

Oh, sorry to introduce this build failure. Thanks Kai to fix it.

Thanks.

On 12/3/21 10:07 PM, Kai Vehmanen wrote:
> Hey,
>
>
> On Fri, 3 Dec 2021, Pierre-Louis Bossart wrote:
>
>>>     127		do {
>>>     128			mutex_lock(&hbus->core.cmd_mutex);
>>>     129			snd_hdac_bus_send_cmd(&hbus->core, hda_cmd);
>>>     130			snd_hdac_bus_get_response(&hbus->core, address, &resp);
>>>     131			mutex_unlock(&hbus->core.cmd_mutex);
>>>   > 132		} while (resp == -1 && retry++ < CODEC_PROBE_RETRIES);
>> Indeed, something's not right here.
>>
>> CODEC_PROBE_RETRIES is defined conditionally
>>
>> #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
>> #define IDISP_VID_INTEL	0x80860000
>> #define CODEC_PROBE_RETRIES 3
>>
>> but it's used unconditionally.
> yup, the definition needs to be moved out.
>
>> We could define this constant unconditionally as a quick fix, but this
>> compilation problem might expose a larger problem.
>>
>> Kai, I wonder if this is code from lines 120 to 139 that we didn't
>> update when we moved to support HDMI with the generic HDaudio parts? I
>> don't see why we could even try to send a command on the bus is there's
>> no audio codec support?
>>
>> hda_codec_use_common_hdmi should be the default assumption now, I don't
>> think we support the old solution, do we?
> We do still support the hdac-hdmi as well, albeit only for select old
> hardware to maintain backwards compatibility.
>
> I'll send the quick fix.
>
> Br, Kai
