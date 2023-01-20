Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B7B675382
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 12:40:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C27413124;
	Fri, 20 Jan 2023 12:39:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C27413124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674214810;
	bh=tbBXWgqiapUJG8C7zgsh1DNF0njabD3B5OzduCCFvps=;
	h=From:To:Subject:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=f19TeK9enXZOIs8EBDTPz98M4JZCz8oUJsz56RaOFrZO9pYZtK4RSvt+/YV8TtLCT
	 anE57a1B2f0y0BbX1C0yXRhM4JQIOdecJ+jeA4ChE1i5IgYZ2gd4rpffAWqCn/Mjp3
	 VGdw8GHuwsoHRryLH7r5TbG469T3zhg7yfHRWBsc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C03D0F800F0;
	Fri, 20 Jan 2023 12:39:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADBD0F8024C; Fri, 20 Jan 2023 12:39:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F893F8024C
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 12:39:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F893F8024C
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=cTCRcFVx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674214745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1xXcSuO0AiQLbXYNr5VYc0ff7zumkq/iSDFeQX1aF+4=;
 b=cTCRcFVxlJpXTBiy9VC3WGMQ3oCG2gb3h6syu+/zJCdbDY6br6dFpW51YtUHivj0zn5jsr
 LzP5E1JFX6RVHn0DucJ/Q2eVfJero8alaqgCtInyy2d5pU7BpEScXSW7Fuiftl5qzQjZNq
 w4IXIKkXZUWbzZP6b3F2xDr0GElVnL0=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-205-pQmfba1kMuefB3c1Aym5Nw-1; Fri, 20 Jan 2023 06:39:04 -0500
X-MC-Unique: pQmfba1kMuefB3c1Aym5Nw-1
Received: by mail-qt1-f197.google.com with SMTP id
 bs22-20020ac86f16000000b003b686e0ef0bso2282699qtb.19
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 03:39:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:message-id:date
 :references:organization:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1xXcSuO0AiQLbXYNr5VYc0ff7zumkq/iSDFeQX1aF+4=;
 b=MyxNfFo66zjzA4NGYIpN2XPr07c78Myi2BL+HAB2NrJUNolfR92YU38lBUjGQeKCcH
 31fpPiuodlpFuNdnt0E3fTpRaMUFXCPmvI/8f96HTQXcYx0dYhw8EjhkzoZf2SaIc1Jy
 weM3Z9P+lDT7hdoQmFGdFzxf3Cw3L85TNwyYLMCjZdq4nR3R3YBJasdjjATGpv9MuJ9S
 nXXp9Lc8vjMiz7FUs5WWhz0cX0QdEczClB/ARBChLHFH5IOGAY/NmjsEYz0O+3zpLLEj
 dvrHFibVDrWOSxoHLq+QLnnOotQueQIY5OpkE4kq8FDw5NBF+Rd6J+l5985wfV1EGHBP
 /0Dw==
X-Gm-Message-State: AFqh2kpaiKR7hsINycbyelKbR9ngqboAMRUiriFBUoYZg6J8d9ssUc7f
 jngS35ERDMEMAyRnAlYy5dxeTkmya24wLwPVPEuEV/x/tVzjFHV6pZEHeCqJMEnP1e1NdgIK8Bc
 29HvxnRp4lS5bGxqAEyEK5BVpvqs1+GL7aTjFi4saX+GvbjBRgKQSVfwbkm5ewVTuAg1/lxyA
X-Received: by 2002:a05:6214:3188:b0:534:cc6f:c16f with SMTP id
 lb8-20020a056214318800b00534cc6fc16fmr20138336qvb.38.1674214743663; 
 Fri, 20 Jan 2023 03:39:03 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvh37tIvJErTMkXMtIRS5C2DbIBVMcdxWfvSMvX6O2GlZdP41xihfbXGqZUgp3++8yVMcsgNw==
X-Received: by 2002:a05:6214:3188:b0:534:cc6f:c16f with SMTP id
 lb8-20020a056214318800b00534cc6fc16fmr20138306qvb.38.1674214743323; 
 Fri, 20 Jan 2023 03:39:03 -0800 (PST)
Received: from hathi.site
 (p200300efa70be300322165cccdccf99e.dip0.t-ipconnect.de.
 [2003:ef:a70b:e300:3221:65cc:cdcc:f99e])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a05620a29ca00b006fcb77f3bd6sm26197692qkp.98.2023.01.20.03.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 03:39:03 -0800 (PST)
Received: from hathi.site (localhost [IPv6:::1])
 by hathi.site (Postfix) with ESMTP id 53404804E1;
 Fri, 20 Jan 2023 12:39:01 +0100 (CET)
From: Mike FABIAN <mfabian@redhat.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: No sound on HDMI by default on Lenovo T14s using Fedora 37
In-Reply-To: <87zgaerfqv.wl-tiwai@suse.de> (Takashi Iwai's message of "Thu, 19
 Jan 2023 11:16:40 +0100")
Organization: Red Hat
References: <s9dy1pzx3ki.fsf@hathi.site> <87k01j6cw6.wl-tiwai@suse.de>
 <s9dfsc7ixik.fsf@hathi.site> <877cxj65s3.wl-tiwai@suse.de>
 <87zgaerfqv.wl-tiwai@suse.de>
X-Face: "';
 oPz9V1+<,`}1ZuxRv~EiSusWq*{Yjr"Sdvbhq'?q=2R\\6Y9O/,SAE`{J|6I=|w/sQg<
 rW_N'E3IV6~f8?\l#Es`]S`mv',PY(`8{$$R?+gLu}Qv/Mn>)?uladFjJ@yl!_p_Jh; 5QxlD6zL:?r
 IXe4FfK$C^mWhh$o`yt; .r.FLZLQOWBt><!; -.DYZ)Nu&1?~*:\36\BGz]"L; nue;
 l\%sJ/]l{is5O Ew?0CF}dPS(ezG0xqUR)xa(L&&c;x{By"`oKvM&i!%+
Date: Fri, 20 Jan 2023 12:39:01 +0100
Message-ID: <s9dbkmtigfe.fsf@hathi.site>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Takashi Iwai <tiwai@suse.de> さんはかきました:

>> And, with this state, can you use the built-in mic?  Also, how after
>> restoring the module option?

Yes, I can use the microphone built into the laptop. I think I can use
that always, independent on whether I use the module option or not.

> Also, maybe more fundamental question: how exactly "it didn't work"?
> Does the HDMI device appear on pipewire / PulseAudio, but the output
> results in silence?  Or Is no HDMI listed there?

HDMI is listed in pavucontrol.

Actually it is listed there 3 times:

    HDMI/Displayport 3 Output (unplugged)
    HDMI/Displayport 2 Output (unplugged)
    HDMI/Displayport 1 Output (plugged in)

But when I select it, I heards nothing from the monitor speakers.
I tried all 3 HDMI/Displayport in pavucontrol because I was not sure
which one was the right one, but I didn’t hear anything when trying to
use any of them.

xrandr showed me the following outputs:

    $ xrandr | grep connected
    eDP-1 connected primary 1920x1080+0+0 (normal left inverted right x axis y axis) 309mm x 174mm
    HDMI-1 disconnected (normal left inverted right x axis y axis)
    DP-1 disconnected (normal left inverted right x axis y axis)
    DP-2 disconnected (normal left inverted right x axis y axis)
    DP-3 disconnected (normal left inverted right x axis y axis)
    DP-4 disconnected (normal left inverted right x axis y axis)
    DP-3-1 disconnected (normal left inverted right x axis y axis)
    DP-3-2 disconnected (normal left inverted right x axis y axis)
    DP-3-3 connected 3840x2160+1920+0 (normal left inverted right x axis y axis) 600mm x 340mm

DP-3-3 is my external monitor which has speakers.

After I did set that module option with modprobe and rebooted, I could
select

    HDMI/Displayport 1 Output (plugged in)

in pavucontrol and hear sound from the monitor speakers. So what xrandr
calls DP-3-3 seems to be HDMI/Displayport 1 (plugged in) in pavucontrol.


> BTW, the lack of AMD SoC stuff might be related with the device power
> state.  A cold boot might change the situation (or trying back to an
> older known kernel).

I’ll try to boot again and see whether it breaks again.
Currently I booted without the module option and it still works, but
there was a kernel update.

-- 
Mike FABIAN <mfabian@redhat.com>
睡眠不足はいい仕事の敵だ。

