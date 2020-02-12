Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A92115A74D
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Feb 2020 12:03:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84BD71677;
	Wed, 12 Feb 2020 12:02:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84BD71677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581505423;
	bh=4g6leNog9Zy/ZUOVVfeH7rNBsMw+2dreWfC5dAOmdRw=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iBYgxZ7Ut1mWVXPG+ef+MoRkBcpu3TfwX9RB101XYazUfRwi6WBS4Eh8kVR16IMnJ
	 cFk8QjwUJEL8JApaWqSCOi81Ivy9fVlJIWKm+HWpDn0BDQldVyP7ZB6jILofjqXvsW
	 yD+WDddvO4gBAR35Ujq37qUhitRWLd21SpcjUBGk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A284EF800E7;
	Wed, 12 Feb 2020 12:02:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81A2EF8014F; Wed, 12 Feb 2020 12:02:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.serbinski.com (mail.serbinski.com [162.218.126.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01E3EF800E7
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 12:01:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01E3EF800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=serbinski.com header.i=@serbinski.com
 header.b="MhWhH9Rd"
Received: from localhost (unknown [127.0.0.1])
 by mail.serbinski.com (Postfix) with ESMTP id 5B51AD006F9;
 Wed, 12 Feb 2020 11:01:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at serbinski.com
Received: from mail.serbinski.com ([127.0.0.1])
 by localhost (mail.serbinski.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hCMGVnst3C2i; Wed, 12 Feb 2020 06:01:46 -0500 (EST)
Received: from mail.serbinski.com (localhost [127.0.0.1])
 by mail.serbinski.com (Postfix) with ESMTP id 70D9CD00693;
 Wed, 12 Feb 2020 06:01:46 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.serbinski.com 70D9CD00693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=serbinski.com;
 s=default; t=1581505306;
 bh=qDlickU02ZsMirNi7OvLtFkUvQ/GB+12rPSlCDuRsos=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MhWhH9Rd+rlN4TPPcXlLIQdva3asJcljwG91E8xKi1vAtOWnGBoigWmwSGU2pqXFw
 nO4KBxhsAJhSkDSF7B4k82VppgYouU7aODtGzgJqcFM21xggXNK3kELA1LjPP1QRMh
 2MDK689fN1KtIpvfYwCymniyKta3p2T8JI6bdK8M=
MIME-Version: 1.0
Date: Wed, 12 Feb 2020 06:01:46 -0500
From: Adam Serbinski <adam@serbinski.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <579e0ae1-f257-7af3-eac9-c8e3ab3b52c7@linaro.org>
References: <20200212015222.8229-1-adam@serbinski.com>
 <20200212015222.8229-7-adam@serbinski.com>
 <579e0ae1-f257-7af3-eac9-c8e3ab3b52c7@linaro.org>
User-Agent: Roundcube Webmail/1.4-beta
Message-ID: <2989c09149976a28d13d4b4eb10b7c7e@serbinski.com>
X-Sender: adam@serbinski.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mark Brown <broonie@kernel.org>, Andy Gross <agross@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v3 6/6] ASoC: qdsp6: dt-bindings: Add q6afe
 pcm dt binding documentation
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 2020-02-12 04:59, Srinivas Kandagatla wrote:
> On 12/02/2020 01:52, Adam Serbinski wrote:
>> This patch adds documentation of bindings required for PCM ports on 
>> AFE.
>> 
>> Signed-off-by: Adam Serbinski <adam@serbinski.com>
>> CC: Andy Gross <agross@kernel.org>
>> CC: Mark Rutland <mark.rutland@arm.com>
>> CC: Liam Girdwood <lgirdwood@gmail.com>
>> CC: Patrick Lai <plai@codeaurora.org>
>> CC: Banajit Goswami <bgoswami@codeaurora.org>
>> CC: Jaroslav Kysela <perex@perex.cz>
>> CC: Takashi Iwai <tiwai@suse.com>
>> CC: alsa-devel@alsa-project.org
>> CC: linux-arm-msm@vger.kernel.org
>> CC: devicetree@vger.kernel.org
>> CC: linux-kernel@vger.kernel.org
>> ---
>>   .../devicetree/bindings/sound/qcom,q6afe.txt  | 42 
>> +++++++++++++++++++
>>   1 file changed, 42 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6afe.txt 
>> b/Documentation/devicetree/bindings/sound/qcom,q6afe.txt
>> index d74888b9f1bb..6b1b17d31a2a 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,q6afe.txt
>> +++ b/Documentation/devicetree/bindings/sound/qcom,q6afe.txt
>> @@ -51,6 +51,24 @@ configuration of each dai. Must contain the 
>> following properties.
>>   	Definition: Must be list of serial data lines used by this dai.
>>   	should be one or more of the 0-3 sd lines.
>>   + - qcom,pcm-quantype
>> +	Usage: required for pcm interface
>> +	Value type: <u32>
>> +	Definition: PCM quantization type
>> +		0 - ALAW, no padding
>> +		1 - MULAW, no padding
>> +		2 - Linear, no padding
>> +		3 - ALAW, padding
>> +		4 - MULAW, padding
>> +		5 - Linear, padding
>> +
>> + - qcom,pcm-slot-mapping
>> +	Usage: required for pcm interface
> 
> Are these not specific to 8k and 16k mode ?
> We should probably list values for both modes here.

No, this is just the offset that the audio sample is placed in with 
respect to a maximum of 4 slots, 16 bits wide, beginning with the sync 
pulse.

When switching between 8 and 16k sample rate, it is just the sync pulse 
rate that is changed. The audio sample will be delivered in the same 
slot, just at a different frequency.


>> +	Value type: <prop-encoded-array>
>> +	Definition: Slot mapping for audio channels. Array size is the 
>> number
>> +		of slots, minimum 1, maximum 4. The value is 0 for no mapping
>> +		to the slot, or the channel number from 1 to 32.
>> +
>>    - qcom,tdm-sync-mode:
>>   	Usage: required for tdm interface
>>   	Value type: <prop-encoded-array>
>> @@ -174,5 +192,29 @@ q6afe@4 {
>>   			reg = <23>;
>>   			qcom,sd-lines = <1>;
>>   		};
>> +
>> +		pri-pcm-rx@105 {
>> +			reg = <105>;
>> +			qcom,pcm-quantype = <2>;
>> +			qcom,pcm-slot-mapping = <1>;
>> +		};
>> +
>> +		pri-pcm-tx@106 {
>> +			reg = <106>;
>> +			qcom,pcm-quantype = <2>;
>> +			qcom,pcm-slot-mapping = <1>;
>> +		};
>> +
>> +		quat-pcm-rx@111 {
>> +			reg = <111>;
>> +			qcom,pcm-quantype = <5>;
>> +			qcom,pcm-slot-mapping = <0 0 1>;
>> +		};
>> +
>> +		quat-pcm-tx@112 {
>> +			reg = <112>;
>> +			qcom,pcm-quantype = <5>;
>> +			qcom,pcm-slot-mapping = <0 0 1>;
>> +		};
>>   	};
>>   };
>> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
