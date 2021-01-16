Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BACF2F9AFA
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jan 2021 09:06:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3D941825;
	Mon, 18 Jan 2021 09:05:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3D941825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610957175;
	bh=WXVbEPHZWkzTKhLkeMaDFokYPFdkwmf0B/IGsYAsgcE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pOzNaFhA61b5QCPO0dxyg5GC1tuOAzNNQ+EqF99aeB5itbjIbeqNElXvY7Rl5X0NH
	 iBRRiT4siG/CzmVfFuw0F4/Uh98J81LDDZTEDRTwcCZybN8s0sZe/kdY+ogSJWyp4S
	 O2OXl6t3HUkoFkUCSM7uYdSRj3wL4ovs6SVA5JE8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8E20F804E4;
	Mon, 18 Jan 2021 09:02:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C52A9F8025E; Sat, 16 Jan 2021 17:19:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F817F80132
 for <alsa-devel@alsa-project.org>; Sat, 16 Jan 2021 17:18:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F817F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Br7DlbQw"
Received: by mail-wm1-x333.google.com with SMTP id m187so3673752wme.2
 for <alsa-devel@alsa-project.org>; Sat, 16 Jan 2021 08:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=d9hZ/TM5iFjRNEPcTQvwAm1Rf9sa0Vn8GHaFhrGDyS8=;
 b=Br7DlbQwVMZMdpQkS8OEUUubQLykxVinoU54O9T5LGgV73zKKYiSYp+EQEgEQHc3kd
 C3zHI+cIQVHmkewFEzkS6QcxKJefsVb1ES17Am1WyRxrmTs971Uo/whoH4+HjPE5eoiC
 3F6dBqeRALhbJTIWkIHFqeX2ItuHqy10KOrCF5B/L9RHSfNf67JXTLzYWloo81nVpHk4
 xpHQ6wf+ER8o+xHl0QwUjSYHkPu0Ms3BN8o6A6/3b5u1Zr4dQgHfl2ZL2rOkHGF/Wr0l
 /CFY6YQthHKjcTy+Nqzmnpo+RGkFnjH3P/OdxF/tjLCwOqgasGv3P8krGRqgRXOnIcg4
 wwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=d9hZ/TM5iFjRNEPcTQvwAm1Rf9sa0Vn8GHaFhrGDyS8=;
 b=mVSTN16NWudsNzvcXfYIYuTYqL0sqfc6Fr/Oq8p7adamNyHeBOh+oNPPoYP7dtJDPE
 0LNE9WwQP5w2r++v5RsmhrYFEAwn27R2hFdXjFVQi5fvyx2ypFin9Hqh4z5Nq6ldQJnY
 fWQvKUKznxI3vTUCs5yt32dywUSAUswPHzMul3pigKSgl7hofKfr0AQkOt9DhKPCL+jb
 lGglvZ5lPbmoSE/7uO0m/BI9wcRO1+yos2a59Wps9u+3zkoB5+XLU3G2Jdsf3fED9+Qy
 /NoeUZfObJ35DVhEAta9eOzLeItIpwSzPJxQFCc+CSTq2gmDaZNACDpRpNFrok5GNdAl
 t8og==
X-Gm-Message-State: AOAM531E3R808qtHTahC0xbNHPFhXSYPOFh2fFfuogK7hX91IXvwXTeX
 d1wSQ2I3sHwt8AFt+3tRuTY=
X-Google-Smtp-Source: ABdhPJwfXUbrlF/7/i3HpOAjRWzSx6CID+NldJIDTrdbVDmdF/K2ezrDy2plL4pyJZXRpJrn9ujOZA==
X-Received: by 2002:a05:600c:2888:: with SMTP id
 g8mr13821246wmd.169.1610813932365; 
 Sat, 16 Jan 2021 08:18:52 -0800 (PST)
Received: from [0.0.0.0] ([2a01:4f8:c17:e10a::1])
 by smtp.gmail.com with ESMTPSA id y6sm18721730wrp.6.2021.01.16.08.18.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Jan 2021 08:18:51 -0800 (PST)
Subject: Re: [PATCH v3 2/3] x86/platform/dell-privacy-wmi: add document for
 dell privacy driver
To: "Limonciello, Mario" <Mario.Limonciello@dell.com>,
 "Yuan, Perry" <Perry.Yuan@dell.com>,
 "oder_chiou@realtek.com" <oder_chiou@realtek.com>,
 "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "mgross@linux.intel.com" <mgross@linux.intel.com>
References: <20210112171755.14408-1-Perry_Yuan@Dell.com>
 <BY3PR19MB49137D1D7508190AF87655FEFAAA0@BY3PR19MB4913.namprd19.prod.outlook.com>
From: Perry Yuan <perry979106@gmail.com>
Message-ID: <b58b36a6-e964-663b-cf76-c058ba6f36eb@gmail.com>
Date: Sun, 17 Jan 2021 00:18:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <BY3PR19MB49137D1D7508190AF87655FEFAAA0@BY3PR19MB4913.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 18 Jan 2021 09:02:51 +0100
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

Hi Mario,
Thanks for your review.
On 2021/1/13 1:54, Limonciello, Mario wrote:
>> -----Original Message-----
>> From: Yuan, Perry <Perry_Yuan@Dell.com>
>> Sent: Tuesday, January 12, 2021 11:18
>> To: oder_chiou@realtek.com; perex@perex.cz; tiwai@suse.com;
>> hdegoede@redhat.com; mgross@linux.intel.com
>> Cc: lgirdwood@gmail.com; broonie@kernel.org; alsa-devel@alsa-project.org;
>> linux-kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; Yuan,
>> Perry; Limonciello, Mario
>> Subject: [PATCH v3 2/3] x86/platform/dell-privacy-wmi: add document for dell
>> privacy driver
>>
>> From: Perry Yuan <perry_yuan@dell.com>
>>
>> Describe the Dell Privacy feature capabilities and devices
>> state class exposed by BIOS
>>
>> Signed-off-by: Perry Yuan <perry_yuan@dell.com>
>> ---
>>   .../testing/sysfs-platform-dell-privacy-wmi   | 31 +++++++++++++++++++
>>   1 file changed, 31 insertions(+)
>>   create mode 100644 Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi
> 
> I don't see a reason that the documentation needs to come in it's own commit.
> In v4, I would think this can collapse as part of:
> "Add support for Dell hardware privacy"
> 
Agreed. will merge this patch content to "Add support for Dell hardware 
privacy"
>>
>> diff --git a/Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi
>> b/Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi
>> new file mode 100644
>> index 000000000000..3dbc2d25b60e
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi
>> @@ -0,0 +1,31 @@
>> +What:		/sys/bus/wmi/devices/6932965F-1671-4CEB-B988-
>> D3AB0A901919/devices_supported
>> +Date:		Jan 2021
>> +KernelVersion:	5.11
> I think this is 5.12 material now.
> Need to update this to approximate 5.12 date.
> 
>> +Contact:	"perry_yuan@dell.com>"
> 
> I think Dell addresses publicly use a period rather than an underscore, no?
> So shouldn't this be perry.yuan@dell.com? (Although I acknowledge it's an
> alias, I don't trust that I/T wouldn't remove that some day).
> 
changed using period for the mail address.
>> +Description:
>> +		Display which dell hardware level privacy devices are supported
>> +		“Dell Privacy” is a set of HW, FW, and SW features to enhance
>> +		Dell’s commitment to platform privacy for MIC, Camera, and
>> +		ePrivacy screens.
>> +		The supported privacy haredware privacy devices are:
> 
> You have a typo here.
will fix this in V4.
> 
>> +		 * 0x0 - None,
>> +		 * 0x1 - Microphone,
>> +		 * 0x2 - Camera,
>> +		 * 0x4 - ePrivacy Screen
> 
> So this is an bitmap encoded in the integer?  I think that needs to be mentioned
> in the documentation.
> 
Indeed it is a bitmap , will change this part as below in V4.

  What: 
/sys/bus/wmi/devices/6932965F-1671-4CEB-B988-D3AB0A901919/devices_supported
  Date:          Jan 2021
-KernelVersion: 5.11
-Contact:       "perry_yuan@dell.com>"
+KernelVersion: 5.12
+Contact:       "perry.yuan@dell.com>"
  Description:
                 Display which dell hardware level privacy devices are 
supported
                 “Dell Privacy” is a set of HW, FW, and SW features to 
enhance
                 Dell’s commitment to platform privacy for MIC, Camera, and
                 ePrivacy screens.
-               The supported privacy haredware privacy devices are:
-                * 0x0 - None,
-                * 0x1 - Microphone,
-                * 0x2 - Camera,
-                * 0x4 - ePrivacy Screen
+               The supported hardware privacy devices are:
+               - 0 = Not Supported
+               - 1 = Supported
+               - Bit0 -> Microphone
+               - Bit1 -> Camera
+               - Bit2 -> ePrivacy Screen

>> +
>> +What:		/sys/bus/wmi/devices/6932965F-1671-4CEB-B988-
>> D3AB0A901919/current_state
>> +Date:		Jan 2021
>> +KernelVersion:	5.11
>> +Contact:	"perry_yuan@dell.com>"
>> +Description:
>> +		Allow user space to check current dell privacy device state.
>> +		Describes the Device State class exposed by BIOS which can be
>> +		consumed by various applications interested in knowing the Privacy
>> +		feature capabilities
>> +		There are three Bits for available states:
>> +		    * 0 -> Off
>> +		    * 1 -> On
>> +		    * Bit0 -> Microphone
>> +		    * Bit1 -> Camera
>> +		    * Bit2 -> ePrivacyScreen
>> +
>> --
>> 2.25.1
> 

