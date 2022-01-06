Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC76486137
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jan 2022 09:01:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3F4417CB;
	Thu,  6 Jan 2022 09:00:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3F4417CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641456090;
	bh=W8BtMfmR8K8AVMml6JeKOdyP6QgeqZP03dPn2lCguS0=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vm35nuH3SKmX1AomDXYsBiN4Kh7417h4rr/xiBdxCtDbOUwmN0g7t1OMG4dKWbu/k
	 szq4j6mNJARO/TEZ5bwsmfMp4edwJazSTAAB+IaT8cILL/ogUrNHsWPD3h/rOVTi7W
	 jVkiAIp1UaLlIDs2RUJr+lKVJt2Ta4NFNQCuWPfo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72CFCF80158;
	Thu,  6 Jan 2022 09:00:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C7DFF80155; Thu,  6 Jan 2022 09:00:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from cable.insite.cz (cable.insite.cz [84.242.75.189])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B3DAF800BB
 for <alsa-devel@alsa-project.org>; Thu,  6 Jan 2022 09:00:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B3DAF800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="eopkbSHa"; 
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="dleROlKJ"
Received: from localhost (localhost [127.0.0.1])
 by cable.insite.cz (Postfix) with ESMTP id 8F2D1A1A3D406
 for <alsa-devel@alsa-project.org>; Thu,  6 Jan 2022 09:00:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1641456007; bh=W8BtMfmR8K8AVMml6JeKOdyP6QgeqZP03dPn2lCguS0=;
 h=To:From:Subject:Date:From;
 b=eopkbSHan0wrTmMiP4LJcAOfNjcbhyMgxIfnJLmW2fLK8cp/n3P6d7Ofu4D25dH0O
 ZNNHgsc2GgKAZgc33HFsTfg6G3xR+kTbZDa5EhDh7fUAYAPXvAq5bDTn0rmxNWpNtE
 ByD8VzsVBOj8mY/vNzq4QVZwI+g9HezLyygYgAMc=
Received: from cable.insite.cz ([84.242.75.189])
 by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N4hu3Ohvsr0s for <alsa-devel@alsa-project.org>;
 Thu,  6 Jan 2022 09:00:01 +0100 (CET)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
 (Authenticated sender: pavel)
 by cable.insite.cz (Postfix) with ESMTPSA id 8DDCCA1A3D405
 for <alsa-devel@alsa-project.org>; Thu,  6 Jan 2022 09:00:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1641456001; bh=W8BtMfmR8K8AVMml6JeKOdyP6QgeqZP03dPn2lCguS0=;
 h=To:From:Subject:Date:From;
 b=dleROlKJ/o6YC1wtlNViDLGpKJr4n2ZlwkeMyAz0afBgxKT0CMtC/bKhOPwFsnQlH
 cmGMxX0U+C8qintS0glxToNlSJwyH0KQKm5HrkMz+QNs6FcHcsdfcJlVw6pdXHhkAo
 eprBck4vFaqWD3QvAzHKcb7rob0faV+LvE+ZI1gA=
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
From: Pavel Hofman <pavel.hofman@ivitera.com>
Subject: UAC2: are UAC2 latency controls included in snd_pcm_status_get_delay?
Message-ID: <3b99eba1-ec94-c9c0-5776-c4b501750023@ivitera.com>
Date: Thu, 6 Jan 2022 08:59:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Hi,

The UAC2 ch. "5.2.4.8 Latency Control" specifies latencies optionally 
reported by the device for individual entities. Especially the overall 
terminal latency TE_LATENCY_CONTROL is interesting.

Some video players include the delay reported by 
snd_pcm_status_get_delay into their AV sync calculation.

A linux USB audio gadget can perform some advanced DSP, which including 
the output device latency can result in a non-negligible overall 
latency. The gadget userspace software could configure the actual value 
to be reported by the gadget to the host in the selector UAC2_TE_LATENCY 
(audio_v2.h). The UAC2-specced max value of over 4 secs is more than 
sufficient for standard use cases.

But I could not find any read of the UAC2_TE_LATENCY control selector in 
the snd-usb-audio driver ( 
https://elixir.bootlin.com/linux/latest/C/ident/UAC2_TE_LATENCY ). 
Please does the driver include this value into the overall delay 
reported through alsa-lib? If not, would it make sense to add such support?

Thanks a lot,

Pavel.
