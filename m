Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A378832B7A2
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Mar 2021 12:52:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2210C18DA;
	Wed,  3 Mar 2021 12:51:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2210C18DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614772359;
	bh=SBRLVx3Qx5+/rakRC0Wz3FeqQCsR6yZCNqI+MP2PYgI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dwvLpdIk9yIr+4zZHZuxTLxJ8kfnNCJhok1SR6sP/pXC0HTv99xDXUaK+v2Q/yFRn
	 8c+hsd7zcyzX+BKzkXuVqkQdwFEvEIiuh1rAjP/gCkG7SXarAen3xhOdZOVRXYgqn2
	 cMhpvb7avkqn7Qt1k7rgaHZADuYE04/AdxkW300g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D26CF80257;
	Wed,  3 Mar 2021 12:51:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 700EFF8025E; Wed,  3 Mar 2021 12:51:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7EA9BF800B2
 for <alsa-devel@alsa-project.org>; Wed,  3 Mar 2021 12:51:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EA9BF800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="aCzLDb7c"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B603f78240001>; Wed, 03 Mar 2021 03:51:00 -0800
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 3 Mar
 2021 11:51:00 +0000
Received: from [10.26.49.13] (172.20.145.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 3 Mar 2021
 11:50:58 +0000
Subject: Re: [PATCH] ASoC: soc-core: Prevent warning if no DMI table is present
To: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
References: <20210302092712.310705-1-jonathanh@nvidia.com>
 <20210302124913.GC4522@sirena.org.uk> <s5hr1kxeah4.wl-tiwai@suse.de>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <806466c4-4ef2-f4ba-3609-81b862810185@nvidia.com>
Date: Wed, 3 Mar 2021 11:50:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <s5hr1kxeah4.wl-tiwai@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1614772260; bh=1AMVTuLDPdQruFXHSdhzo4SnKHhmVWXwXkkJpkM8YqE=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=aCzLDb7c2b3EmDwbw4yNcqOD0hSqFwNbIJIYrjf05IWPN5G/awnzNJUVdtSYFvU+3
 vgtOdOdL1MZxMxxglgcrUrdvoPn17q5bgxrkofNX8OrRWr92nteIhiyCUmixMxNX2C
 9cOYnu4mDd9POGHWj8gTLuIqfnwrpJb4WIShyqIzKjuQ26Kn/vszdjokcT3ZGrkM7F
 pga93684vDYKLw172v1UDsjM95syon9ibY2FE8DZR37NAAX3+GmI12vhccuM74GT9w
 BVL79B85Grq0G+s3YemvY6o9kd86dJsJhhmTQ7Fzu4a2PbAilflqNj57MHBMOkz9LZ
 h5/4m6J8NwLaQ==
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, Liam
 Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
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


On 02/03/2021 17:23, Takashi Iwai wrote:
> On Tue, 02 Mar 2021 13:49:13 +0100,
> Mark Brown wrote:
>>
>> On Tue, Mar 02, 2021 at 09:27:12AM +0000, Jon Hunter wrote:
>>> Many systems do not provide a DMI table and on these systems a warning,
>>> such as the following, is printed on boot ...
>>>
>>>  WARNING KERN tegra-audio-graph-card sound: ASoC: no DMI vendor name!
>>>
>>> If DMI support is enabled in the kernel, there is no simple way to
>>> detect if a DMI table is table or not. Note that the variable
>>> 'dmi_available' is not exported and so cannot be used by kernel modules.
>>
>> We could fix that, or provide an accessor function?  Or only warn if
>> we're on an ACPI system (which we can check from a module).  This really
>> does feel like something we should be warning about on systems that are
>> supposed to have DMI information available as standard.
> 
> I had the same feeling when I took a look at the patch, but later
> changed mind, since the error will pop up also if a system has an
> unmatured BIOS with some bogus vendor DMI string, too.  That is, users
> of such a machine gets always an error message although this isn't any
> serious problem unless you need a dedicated UCM profile (which can't
> be used on such a system in anyway).
> 
> So, I agree that exporting dmi_avilable could improve the situation a
> bit, but the error level needs still reconsideration.


Thanks for the feedback. Yes it is probably better if we have a specific
test. I will send out a V2 for review.

Thanks
Jon

-- 
nvpublic
