Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C37235700B3
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jul 2022 13:31:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6244A820;
	Mon, 11 Jul 2022 13:30:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6244A820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657539109;
	bh=RtUI3YVTniuQqQyCVgYHwdYHzgd3TZ56EpkqQClIqk0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AKQJ1kzqrPqQKJEauoYS7wB69LNiOaXNddftJZBzXA1mpNJPKTXxOnVabJrjlAmEC
	 0ufHxCFQJjTCTCXcxNsw/3jABPhTadMwzvCHAR7FtjeJFfAq62JMypS0fh0QZDhbzl
	 HkzegHyqtHsbigFAJPIphK4by9AogjxmC5ioYhoY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCFE9F800E1;
	Mon, 11 Jul 2022 13:30:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 767D4F80163; Mon, 11 Jul 2022 13:30:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47597F800E1
 for <alsa-devel@alsa-project.org>; Mon, 11 Jul 2022 13:30:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47597F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="f6nYhN9C"
Received: by mail-pl1-x62a.google.com with SMTP id c13so4171776pla.6
 for <alsa-devel@alsa-project.org>; Mon, 11 Jul 2022 04:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wr7Uw8yn9unahgMnORJ86ja+LJB3cTbK7uj0xAHrAfo=;
 b=f6nYhN9C/kmt8vLwdLvpnKY3jDDaFASFgBkS3Q/PMrqhJ+6c1fAi7oT6x9A5H99d0z
 WZylSadch+BF0/ekecpQahLwTWQUVxiSh7Sm0oc9nSlMhM3XSHckfEM5ROkEge299ou5
 te4AWGi4gv/8R+9zk3XV3JuiPiFTRWh3A3r5RYy7N0vDMERRtqrVrJNH/lsPXzud4kmo
 1VX96l6/lbp59aY9qYyYDCqpTahp8N11oohYpm+YihiX7UuYHry3zk4iLKncpfQ4JtDj
 88pLuLJ3JQYT6NoeFVDnaL35A79JdpAb6eDk/Zxvy59x9N2mY6BS7GlGnYZ3KbvQBcqu
 kM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wr7Uw8yn9unahgMnORJ86ja+LJB3cTbK7uj0xAHrAfo=;
 b=20ksdYxoVjgmlQjmthy6lOG1n2GCiCx5/PN3Ov7GNSEADSm9hvIL8jBDkdPzisrtzl
 WiK7wecRRm+aBTVfqOkNVrn95la2QZcm8c+lC2sMNn+vc6glCUNDL/8qBkKBUd+Wp62r
 fNLMXojnFXb/MXDIBPPLAGL8v9AJx/n5l5j0wYWQfJy/nIfK8O2FuLu/sc7pBoKjPPXr
 Z+a8G+8tisIKarYq83YbargPC38ndveuwm5MoDxSAKjW+hQ15xvCfpr6SMewcs+7q+3E
 RKL+yT12SSfGAyoUZRfRzZX+O62hp5IErHTbY3UIpw5DfIMxoBPbMLAT4epAsIKDBSNw
 pU7A==
X-Gm-Message-State: AJIora924VrX0KUJExlr8WVaSC5ZlqQdtDZtaLB14MEIQ25G116blYMx
 +rm+i1n4dbCe7eMIv86a81A=
X-Google-Smtp-Source: AGRyM1sACXFvuHS4opL1GFfrK+iDHo6k7qxx3X4LInhfcgXYUQYDqcgAqs2RDdTXZr/64iPNIVZ9pQ==
X-Received: by 2002:a17:902:c94e:b0:16c:4d5e:5dfc with SMTP id
 i14-20020a170902c94e00b0016c4d5e5dfcmr4019452pla.56.1657539039930; 
 Mon, 11 Jul 2022 04:30:39 -0700 (PDT)
Received: from ?IPV6:2001:b400:e33d:bcde:8d15:14bc:c5c2:13d0?
 (2001-b400-e33d-bcde-8d15-14bc-c5c2-13d0.emome-ip6.hinet.net.
 [2001:b400:e33d:bcde:8d15:14bc:c5c2:13d0])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a170903121200b0016bef6f6903sm4472395plh.72.2022.07.11.04.30.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 04:30:39 -0700 (PDT)
Message-ID: <d83ce462-6438-10bc-4a12-f5ec7375f49e@gmail.com>
Date: Mon, 11 Jul 2022 19:30:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.1
Subject: Re: [PATCH] ASoC: nau8821: Add headset button detection
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Seven Lee <wtli@nuvoton.com>
References: <20220627032959.3442064-1-wtli@nuvoton.com>
 <YrmfD3M9FdD8pLY8@sirena.org.uk>
From: SevenLee <scott6986@gmail.com>
In-Reply-To: <YrmfD3M9FdD8pLY8@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, SJLIN0@nuvoton.com, KCHSU0@nuvoton.com,
 lgirdwood@gmail.com, YHCHuang@nuvoton.com, CTLIN0@nuvoton.com,
 dardar923@gmail.com, supercraig0719@gmail.com
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


On 6/27/2022 8:14 PM, Mark Brown wrote:
> On Mon, Jun 27, 2022 at 11:29:59AM +0800, Seven Lee wrote:
>> This patch adds the function of headphone button detection,
>> Button detection will be enabled if the device tree
>> has a key_enable property.
> Is there any reason why we wouldn't support button detect - is this
> device unusual in requiring some external hardware to support that or
> something?

Because the size of the external resistance will affect the speed of JD
detection (insertion or extraction). When the eject detection is slow, 
the key event
may be accidentally triggered before the unplug event is issued.Causes error
detection to occur, which can cause User Space application errors. But 
the chip
design is finalized and cannot be changed. Since this is a known issue, some
client applications do not need to use key detection applications, so 
they hope to
turn off the key detection function. Since this is a known issue, some 
customer
applications do not need to use keystroke detection applications, so 
they want to
turn keystroke detection off. In this way, the application can avoid 
seeing the
occurrence of key events.

