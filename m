Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 454E71667C6
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 20:59:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FB6B16B1;
	Thu, 20 Feb 2020 20:59:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FB6B16B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582228791;
	bh=4lOSDA/9URSc4CnEpvvei355ta8AMW15ni6TXPCrrhQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q+rFF9AUp06FLFv76vDna3zR+9LgS9ebwICNQCQdeOhmto0qwYAZEQlEXmPz1+oLa
	 jrv6JacLoDg51jS7uYp+uIhXbTwWs3F4PPOgNUptuo1OBm7eWXgZQp1g1ZTAZtZBj7
	 AuZ4RD1splr2tihS+6Pmv4c0sviMutAPgeSlhItU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFE7DF8011D;
	Thu, 20 Feb 2020 20:58:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4B04F80148; Thu, 20 Feb 2020 20:58:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF1B7F80101
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 20:58:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF1B7F80101
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="DTsCqBR8"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01KJw089091321;
 Thu, 20 Feb 2020 13:58:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1582228680;
 bh=QY2p35jnOX+tGMplVPO4s4YGc5syAWgGNS1/5A3DBp4=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=DTsCqBR8FtIjnpDh/l+lhfbk3Uaf2ZuGIQnnwepawTxhnlRLQq/vwMf2gSXIm+su6
 DcCUfK5eEA5uhGD2WpPt4Sz/JAxEGpqiSkTm/VMQlFlVtPpuoSBlp9yw7s12F8QlWh
 NNtp49MsOZXo3kpznuKug7aTIpSh+ypPWf5h1ypA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01KJw0NP012754
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 20 Feb 2020 13:58:00 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 20
 Feb 2020 13:58:00 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 20 Feb 2020 13:58:00 -0600
Received: from [128.247.59.107] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01KJw0q5053040;
 Thu, 20 Feb 2020 13:58:00 -0600
Subject: Re: [PATCH] ASoC: tas2562: Add support for digital volume control
To: Mark Brown <broonie@kernel.org>
References: <20200220172721.10547-1-dmurphy@ti.com>
 <20200220184507.GF3926@sirena.org.uk>
 <de0e8a5b-8c2a-ee04-856f-f0d678a3c66b@ti.com>
 <20200220191803.GH3926@sirena.org.uk>
 <6f3ff810-5e75-cb33-10d6-198a7c5cd202@ti.com>
 <20200220194048.GI3926@sirena.org.uk>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <7e08798f-ec91-1eb2-c082-cfbccc6d6202@ti.com>
Date: Thu, 20 Feb 2020 13:52:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200220194048.GI3926@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com
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

Mark

On 2/20/20 1:40 PM, Mark Brown wrote:
> On Thu, Feb 20, 2020 at 01:22:34PM -0600, Dan Murphy wrote:
>> On 2/20/20 1:18 PM, Mark Brown wrote:
>>> decisions causing changes in the driver.  The system may have an
>>> external amplifier they prefer to use for hardware volume control, may
>>> prefer to do entirely soft volume control in their sound server or
>>> something like that.
>> But this is an amplifier.  Not sure why the system designer would design
>> cascading amplifiers.
>> And if that was the case wouldn't you want the output to be low so you don't
>> overdrive the ext amplifier front end?
> The point is that we don't know what people are doing and should try to
> keep the kernel out of policy decisions unless there's something that's
> clearly just unconditionaly right for all systems.  It's a lot easier to
> just have a clear rule that we defer to the wisdom of the silicon vendor
> than try to get into defaults, and it's a lot easier to just do this as
> consistently as we can rather than debating individual configuration
> changes.
>
I completely agree on keeping policy decisions out of the kernel.

>> I was considering safety in that the device is on at full blast (not sure
>> why the HW is defaulted that way but it is).
> I bet there's been issues with people turning things on and not
> realising they need register writes to hear anything, and the volume
> control here is a bit complex as well.
Ack
>
>> But if volume is adjusted prior to playback then this is not an issue.  But
>> if volume is not adjusted then it plays full blast.
> Wouldn't be the first time.  See all the dual purpose headphone/line
> outputs that people build, sensible defaults for headphones and line
> outputs are rather different.

OK.  I will remove them. Will do v3 tomorrow as v2 rearranged the values 
properly.  V3 will remove them.

Dan

