Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D85A41F5AB5
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jun 2020 19:41:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F1A21607;
	Wed, 10 Jun 2020 19:40:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F1A21607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591810905;
	bh=m+fcoU4cJI4qwVQ+axi7uEHC9B7d6HDaCiWYOkvvZ/U=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hnoMHLAe37i9JRPWdB/BArfxgokatlJwWadIl/+q1tCAQ8uqA5t4Wlaes1faI4sR+
	 4BzuCIfkYN6JWnxKZD4+PLJnrC3KrS6TSh4l4SRlW/7JMY/nLeVWdz3y6X436JPgGS
	 YYc89ZYFsffd5TUrckCGOTXcDBEnpafYurUIs7TE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8D9FF80088;
	Wed, 10 Jun 2020 19:40:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FBA6F8021C; Wed, 10 Jun 2020 19:40:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D5EAF800E0
 for <alsa-devel@alsa-project.org>; Wed, 10 Jun 2020 19:39:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D5EAF800E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="UTlj2Y1Z"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ee11a8c0000>; Wed, 10 Jun 2020 10:38:20 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 10 Jun 2020 10:39:52 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 10 Jun 2020 10:39:52 -0700
Received: from krypton.plattnerplace.us (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 10 Jun 2020 17:39:52 +0000
Subject: Re: [PATCH] ALSA: hda: Add NVIDIA codec IDs 9a & 9d through a0 to
 patch table
To: Takashi Iwai <tiwai@suse.de>
References: <20200605171707.8587-1-aplattner@nvidia.com>
 <s5h36787heo.wl-tiwai@suse.de>
X-Nvconfidentiality: public
From: Aaron Plattner <aplattner@nvidia.com>
Message-ID: <b64129f4-dfd2-1e1c-4034-6d784d6c41ab@nvidia.com>
Date: Wed, 10 Jun 2020 10:39:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <s5h36787heo.wl-tiwai@suse.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1591810700; bh=dkJK8uhHxSkGlkS1wCRSDT9sGT6285+nfvdIw4vwg4I=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
 Content-Language:Content-Transfer-Encoding:X-Originating-IP:
 X-ClientProxiedBy;
 b=UTlj2Y1Z0Y0bXkN8N5DMd5u6n8t1xLaUeTU3UNMeiwDNVysZ6B2DLLH3lZzz8zBbD
 zGGWl+RXP5OUYr2+DsRf3mxfOXjQhMNxut74N6HS9E5a5Ee2lGaPZJ7W9DZNIfYraY
 +qGsvkTNOKce1aW2RenK4nXIPgYa9uxPwA0JsYTYKA9JaTSIlVkYqRg2KbW/BFjOZ4
 NUvT0wczxZjRQMsu4dZrTIF4AbYmFdWbsCqhqQCWjjD1X+/InWUw5MgRe+PIB6FrX8
 3FWgv0epamlOUcKv/NENkzG8CHPvjES/xSlU0M007stJR69s4y7Etn/RFn5R1xWvMH
 Uv6pjszoyIgdg==
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Nikhil Mahale <nmahale@nvidia.com>
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

On 6/6/20 1:00 AM, Takashi Iwai wrote:
> On Fri, 05 Jun 2020 19:17:07 +0200,
> Aaron Plattner wrote:
>>
>> Signed-off-by: Aaron Plattner <aplattner@nvidia.com>
> 
> Could you give a bit more information?

Hi Takashi. Sorry for the slow reply and the terse commit message. I 
can't say a whole lot about these but I can say that they're for 
upcoming chips with audio functions that are largely similar to the 
existing ones.

-- Aaron

> We have no idea whether they've tested, whether they are already in
> market, whether any feature changes on those chips or compatible with
> others, etc.
> 
> 
> thanks,
> 
> Takashi
> 
>> ---
>>   sound/pci/hda/patch_hdmi.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
>> index fbd7cc6026d8..e2b21ef5d7d1 100644
>> --- a/sound/pci/hda/patch_hdmi.c
>> +++ b/sound/pci/hda/patch_hdmi.c
>> @@ -4145,6 +4145,11 @@ HDA_CODEC_ENTRY(0x10de0095, "GPU 95 HDMI/DP",	patch_nvhdmi),
>>   HDA_CODEC_ENTRY(0x10de0097, "GPU 97 HDMI/DP",	patch_nvhdmi),
>>   HDA_CODEC_ENTRY(0x10de0098, "GPU 98 HDMI/DP",	patch_nvhdmi),
>>   HDA_CODEC_ENTRY(0x10de0099, "GPU 99 HDMI/DP",	patch_nvhdmi),
>> +HDA_CODEC_ENTRY(0x10de009a, "GPU 9a HDMI/DP",	patch_nvhdmi),
>> +HDA_CODEC_ENTRY(0x10de009d, "GPU 9d HDMI/DP",	patch_nvhdmi),
>> +HDA_CODEC_ENTRY(0x10de009e, "GPU 9e HDMI/DP",	patch_nvhdmi),
>> +HDA_CODEC_ENTRY(0x10de009f, "GPU 9f HDMI/DP",	patch_nvhdmi),
>> +HDA_CODEC_ENTRY(0x10de00a0, "GPU a0 HDMI/DP",	patch_nvhdmi),
>>   HDA_CODEC_ENTRY(0x10de8001, "MCP73 HDMI",	patch_nvhdmi_2ch),
>>   HDA_CODEC_ENTRY(0x10de8067, "MCP67/68 HDMI",	patch_nvhdmi_2ch),
>>   HDA_CODEC_ENTRY(0x11069f80, "VX900 HDMI/DP",	patch_via_hdmi),
>> -- 
>> 2.27.0
>>
