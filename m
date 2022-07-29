Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38187584C88
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jul 2022 09:28:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0201163B;
	Fri, 29 Jul 2022 09:28:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0201163B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659079730;
	bh=+WH5mU8q2Ij5OPsTzYlvhec3B8h9VtopZ4xAeWNWUVg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SdjGUa+U+2/hjMbt2we6kfHowPOu0z3wrZ9hwsIJdZR3rihY9ruWh6cWYgge9Mw6u
	 fm++3OeGgtScQNlJCHOj7rvcnFlddwJZT6H4HL2yMTwZGnd98USN78oAliTvBcqb9F
	 vSj2WInckA1o5nNNttCr3zxBgKeDRIHRSJj677/8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18783F80224;
	Fri, 29 Jul 2022 09:27:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93E3AF8049C; Fri, 29 Jul 2022 09:27:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NO_DNS_FOR_FROM,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 205D1F80224
 for <alsa-devel@alsa-project.org>; Fri, 29 Jul 2022 09:27:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 205D1F80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="T0oOJNOq"
Received: by mail-pf1-x436.google.com with SMTP id w185so3932541pfb.4
 for <alsa-devel@alsa-project.org>; Fri, 29 Jul 2022 00:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=qgng3/T4C960A2jx6DUhT1LSO8g9Z6SZgik1QGNnmbg=;
 b=T0oOJNOqKvB+cUaYgHmlgIzemEcsamYmiA64B7IzQbS58fahZ4n3599AHAw9i2ztbT
 4hXGKq6bCIlRDzzYXGB87YmDrLWrKfWoiAPXfCz1IGF5ksk4HSaS3ghpjmPxu8Xwgr+H
 0DebLyGLHr89E5Z5AGLa3ys2Ta0iheRQNwd3VnIvdhrthfZrLhAu7k2N1z253Ww5XykG
 WGLSpj+QyXBxr0WVClkJ00aIhMvTRgTQX75I7uBmRXj4+9BZfZY+J2SZ1/YQdYqOghjj
 9WBhoNYAmQHv2wpqEOS9Xb1//BqkWFG4kk6KQVzU1+LWRIcUjAI67s2zlsqLv1F4okDT
 GIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=qgng3/T4C960A2jx6DUhT1LSO8g9Z6SZgik1QGNnmbg=;
 b=PqQ6r3mQL2HJYC2AThRgFnVQD1hL8An/X03++0vQowgo7A2WLfe35RCIkoGkSVL36F
 fjyYYQ6CF+RuMqhIsq+U7OsNRjj/HgcEC1QESc/pk97ppzN1Q1c1mwWN0XBsO+CCkK6i
 DKo8neNbbinCHkPC5y2AJWSjG8ztGVB6DEM7zztE+biTBGJFpvr5mmQZtHV2sFwC/UL4
 vBjejd8cIV5Y88H4ICl9h5aH/MCPL0bDbVmA3tjlKXWr1pCJn1oIETS7T8zU1780/05K
 8p/9LDy2yGoegg8PMXbWypRaP4VAhwP/vxFIWetAFJ1/rGNiEbQxKllzs+OHOwjwwTtP
 P8XQ==
X-Gm-Message-State: AJIora+3P+RhMdavsXrwL//WeMa0vmSAwypF1tWpmggXRGto//wZWjkM
 Ngqk5s5QPJPYqC4Hvb4VkmA=
X-Google-Smtp-Source: AGRyM1sU7YhyoEZzOyHZR2+mx4WVkzlZTd7s3bZU9krZgp+j5KHK/LoAcEPTB1TnCgglkW0Ux36d2Q==
X-Received: by 2002:a63:4e04:0:b0:41b:955a:35d3 with SMTP id
 c4-20020a634e04000000b0041b955a35d3mr551988pgb.383.1659079663282; 
 Fri, 29 Jul 2022 00:27:43 -0700 (PDT)
Received: from a-VirtualBox.. ([116.233.75.140])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a1709027e0c00b0016d3a354cffsm2677137plm.89.2022.07.29.00.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 00:27:43 -0700 (PDT)
From: Zhu Ning <zhuning0077@gmail.com>
To: pierre-louis.bossart@linux.intel.com
Subject: Subject: Re: [PATCH v3 2/2] ASoC: dt-bindings: Add Everest ES8326
 audio CODEC
Date: Fri, 29 Jul 2022 15:27:21 +0800
Message-Id: <20220729072720.420184-1-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220727152203.GA2681685-robh@kernel.org>
References: <20220727152203.GA2681685-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, zhuning0077@gmail.com, tiwai@suse.com,
 20220727152203.GA2681685-robh@kernel.org, broonie@kernel.org,
 zhuning@everest-semi.com, yangxiaohua@everest-semi.com
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

>> +  everest,jack-detect-inverted:=0D
>> +    description:=0D
>> +      Defined to invert the jack detection.=0D
>=0D
>What's the difference with this and bit 3 of everest,jack-pol?=0D
>=0D
>We already have numerous vendor properties for jack detect. Can we come =0D
>up with something common?=0D
>=0D
>The problem with 'inverted' is it assumes you know the non-inverted =0D
>state. Better to just state high or low.=0D
=0D
This property is in compatible with the property in es8316.c and sof_essx83=
36.c.=0D
(which is not documented in es8316.yaml, another problem)=0D
There is a quirk in sof_essx8336.c so that when the user find they're havin=
g a =0D
wrong jack insert configuration, they can set the quirk to invert it.=
