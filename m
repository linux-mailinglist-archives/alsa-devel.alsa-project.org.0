Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5101F44C7
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 20:08:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C71C1670;
	Tue,  9 Jun 2020 20:07:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C71C1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591726123;
	bh=k/McQfB2lEQxeVRZ6MGo0ZSBodW9VlS0l1gTmUK3Kc8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W/o3hRHF4ILei3X37Hi6PmPBSsOKH76J0zqZ5xnlHVphKU30A2fJmR9X+6w+WdNx2
	 9N9t2opKnI/9YBNlKlyZrSPv9NCwRRBYcA2R+nOIxldrNTwWjkWqLUuJWRfRpzwx6s
	 xdszeDvcPb4z/0xABD0+g+H3ijy+AevlfSyaS7Us=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F75CF8028D;
	Tue,  9 Jun 2020 20:07:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDAF5F8028C; Tue,  9 Jun 2020 20:06:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95DBEF80124
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 20:06:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95DBEF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="oRqgEQNf"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 059I6rtO068877;
 Tue, 9 Jun 2020 13:06:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1591726013;
 bh=xSfKR8MnxMrg+HE8ph5OJ1uYPhsGztBaHv6HeUzvjsg=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=oRqgEQNf8s6fMmWqKU2Y16ZgyesitluWmLQ1OVFCf20DGT2WvROwStJwzsaZ2vDDZ
 jJQRnDxMnFlghP6eEhYSAok7gReQhOomhx112hUn+bUb26ft902EQj4bhAtabZZZgT
 GBdmO1nLkUOpojhglC0AAweIyeBvn7BqJ3WuGx5A=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 059I6r0a034979;
 Tue, 9 Jun 2020 13:06:53 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 9 Jun
 2020 13:06:53 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 9 Jun 2020 13:06:52 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 059I6o70086650;
 Tue, 9 Jun 2020 13:06:51 -0500
Subject: Re: [RFC PATCH 1/2] dt-bindings: tas2562: Add firmware support for
 tas2563
To: Mark Brown <broonie@kernel.org>
References: <20200609172841.22541-1-dmurphy@ti.com>
 <20200609172841.22541-2-dmurphy@ti.com> <20200609173143.GN4583@sirena.org.uk>
 <bb7cff87-f814-1b37-c9eb-e68919e3c077@ti.com>
 <20200609175852.GQ4583@sirena.org.uk>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <414a2d73-6d09-1e76-59c8-4943c0e8f720@ti.com>
Date: Tue, 9 Jun 2020 13:06:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200609175852.GQ4583@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com
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

On 6/9/20 12:58 PM, Mark Brown wrote:
> On Tue, Jun 09, 2020 at 12:35:50PM -0500, Dan Murphy wrote:
>> On 6/9/20 12:31 PM, Mark Brown wrote:
>>> Why not just use a standard name for the firmware?  If the firmwares
>>> vary per-board then building it using the machine compatible (or DMI
>>> info) could handle that, with a fallback to a standard name for a
>>> default setup.
>> The number of firmwares can vary per IC on the board itself.  So you may
>> have X number of firmware files all with different names all targets for
>> different TAS2563 ICs.
>> Also TI will not be providing the individual binaries to the customer.
>> There is a customer tool that the user uses to create the binaries.
>> So the output names are arbitrary.
>> I was going to mention this in the cover letter but did not think mentioning
>> the user tool had any value
> That's all fairly standard for this sort of device.  You could still
> cope with this by including the I2C address in the default name
> requested - do something like tas2562/myboard-addr.fw or whatever.  The
> concern here is that someone shouldn't have to replace their DT if they
> decide they want to start using the DSP, and someone making a distro
> shouldn't be stuck dealing with what happens if multiple vendors decide
> to just reuse the same name (eg, just calling everything tas2562
> regardless of plastics).

I could make a default as you suggested to include i2c address and bus 
in the name.  But the TAS2563 does not need the firmware to operate and 
the 2562 does not have a DSP.

What if there was an ALSA control instead that passed in the firmware 
name from the user space instead of using the DT?

Then the control can load and parse the firmware and wait for the user 
to select the program.

This would solve a user from having ot update the DT to use a firmware.

Dan

