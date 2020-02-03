Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C62F41510EC
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Feb 2020 21:21:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66FA01697;
	Mon,  3 Feb 2020 21:20:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66FA01697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580761276;
	bh=kVydC2OpE5e4LgGHSuW3/mNIdUE+e0l+L4V8kNXzs8g=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F4/D9p4KkPfcBA+SrNMp5jl7tHKvUurw8M6PK/aipHdIzKZAUlt6ia/oeoq10bW8c
	 EZGXgHyIsp49dvUugltN2XQt8Phcdlq2Dibyt2acuuY5YVeMtOcz3yCUSbPPxpF+1T
	 KZybRfEhVI+VVOvvnfM96rELpFIPG/4yLU3WpoqQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F723F8011D;
	Mon,  3 Feb 2020 21:19:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD007F80148; Mon,  3 Feb 2020 21:19:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79299F8011D
 for <alsa-devel@alsa-project.org>; Mon,  3 Feb 2020 21:19:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79299F8011D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="s8G/UjN6"
Received: by mail-lf1-x142.google.com with SMTP id z26so10566454lfg.13
 for <alsa-devel@alsa-project.org>; Mon, 03 Feb 2020 12:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9GXJ+7r6oiE/L24yszgp1Pie8R7EQEZ8furWhzEtKIk=;
 b=s8G/UjN6/Iggd3V7YYei6RXf4vXI2Jj2Jd9wlbbaFcBkjtKIph8VvxRkG+njnQdjHT
 sPK4Fbtmb08yfyvcb9STkYPkuFcOWUfRwN+k7JLRCWAaP3Mnm8pmEmK4JLE5xmn0YQt3
 FAjbFsz4E8y6vCQRCYlhJp44FjPd7hfGBH6Tgx4K1fc5MAs/5P0UyBBUEgaVn/h0srmX
 qMCyfYzt2XiRLrggy/kOMG0ls5i+GE/d+uUvJIr0wogUDluYJe1+JVc9PKPFcBpi7JFR
 /MLYzCV1lWewB+3w6xqFX2XLOxr02yuWi8s1q0kLPcp+LSNS6cmed5/qe+ELInKkeWic
 RQ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9GXJ+7r6oiE/L24yszgp1Pie8R7EQEZ8furWhzEtKIk=;
 b=TbazUmDJ4YiGHnbp1caMMKGhobDp6xcgTLhbNxR4yOvR0Ifrae+4RI4deycSnFwrMv
 5fd7ryGDtEFFhh6aVDty7OJAYpekovCOer/OQo+lX+o9MAgFt8/GxxtQTJ676ZXeTaI7
 FrdbPI1M35HZ14rPynRAt/kCvOSF51wLSaGEGx4k4TVrSuzyahSJoT80Qk0EyUGKwFk6
 Y+xgLZ6cAdFEcrWOUoY8mvkL9gjuOuz3mYI5libeoC5UcFeq0pWtmGacynDkv7Wlk6ah
 kb3kMEMWoZapFCQLeOnsRoj5jklegs9j7BzILcwEs7oMbIb7RXhdTF5OVMOdv+YpxJCu
 0eQQ==
X-Gm-Message-State: APjAAAXuIsX0XfbZ30Zv6l1ZSGvUTE99hGJufrYAbNqiIloUypcW4C4+
 vmUI0atsYXTLjVkmYh6nwuc=
X-Google-Smtp-Source: APXvYqwzpgdvLMjIj20yWb5w3ZfeDuvBaMreduxxHsa9a72L0x/lbj7UgdSdmQVXk1ab61jn6P20Sg==
X-Received: by 2002:a19:c192:: with SMTP id
 r140mr12870058lff.113.1580761166596; 
 Mon, 03 Feb 2020 12:19:26 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37]) by smtp.googlemail.com with ESMTPSA id
 r12sm10298001ljh.105.2020.02.03.12.19.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2020 12:19:25 -0800 (PST)
To: Sameer Pujar <spujar@nvidia.com>, perex@perex.cz, tiwai@suse.com,
 robh+dt@kernel.org
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-2-git-send-email-spujar@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <32d6c62d-0ac4-54e0-2efb-9f9a8cf2d271@gmail.com>
Date: Mon, 3 Feb 2020 23:19:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <1580380422-3431-2-git-send-email-spujar@nvidia.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 jonathanh@nvidia.com, viswanathl@nvidia.com, sharadg@nvidia.com,
 broonie@kernel.org, thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
Subject: Re: [alsa-devel] [PATCH v2 1/9] dt-bindings: sound: tegra: add DT
	binding for AHUB
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

MzAuMDEuMjAyMCAxMzozMywgU2FtZWVyIFB1amFyINC/0LjRiNC10YI6Ci4uLgo+ICtwcm9wZXJ0
aWVzOgo+ICsgIGNvbXBhdGlibGU6Cj4gKyAgICBvbmVPZjoKPiArICAgICAgLSBpdGVtczoKPiAr
ICAgICAgICAgIGNvbnN0OiBudmlkaWEsdGVncmEyMTAtaTJzCj4gKyAgICAgIC0gaXRlbXM6Cj4g
KyAgICAgICAgICAtIGVudW06Cj4gKyAgICAgICAgICAgICAgLSBudmlkaWEsdGVncmExOTQtaTJz
Cj4gKyAgICAgICAgICAgICAgLSBudmlkaWEsdGVncmExODYtaTJzCj4gKyAgICAgICAgICAtIGVu
dW06Cj4gKyAgICAgICAgICAgICAgLSBudmlkaWEsdGVncmEyMTAtaTJzCgpDb3VsZG4ndCB0aGlz
IGJlIHNvbWV0aGluZyBsaWtlIHRoaXM6Cgpwcm9wZXJ0aWVzOgogIGNvbXBhdGlibGU6CiAgICAt
IGVudW06CiAgICAgIC0gbnZpZGlhLHRlZ3JhMjEwLWkycwogICAgICAtIG52aWRpYSx0ZWdyYTE4
Ni1pMnMKICAgICAgLSBudmlkaWEsdGVncmExOTQtaTJzCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2
ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
