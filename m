Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA66814DFE3
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jan 2020 18:27:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FD381664;
	Thu, 30 Jan 2020 18:26:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FD381664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580405243;
	bh=Gw+ianHvLIu1GfBDcump7xH74MhYx8a4jkHVzdl+tCc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SdoxljOGvF0kr96ngFviQ9AbTYgZ0XVmnPyGGnUyfn0wz2b6CNhdWicfY/bB3dKoX
	 RC4g8yhCOXRhENBirNCPaD41cqtUAq1GHOEDicPyYPQ6DUpl4WhpzOnJEHbUsc9V6t
	 BbIgh5oN3hdUwfPdqYAvd1SKMsxT9V8g3m1lxp8A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0697AF801EB;
	Thu, 30 Jan 2020 18:25:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9974F80150; Thu, 30 Jan 2020 18:25:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F3D2F80082
 for <alsa-devel@alsa-project.org>; Thu, 30 Jan 2020 18:25:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F3D2F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="eqifi7oY"
Received: by mail-ed1-x544.google.com with SMTP id c26so4653299eds.8
 for <alsa-devel@alsa-project.org>; Thu, 30 Jan 2020 09:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JBuUU9YguZE61sauS+J8SEajdxsJ22GtHtPHR00xnwQ=;
 b=eqifi7oYW1I8KdEzjX6tWdUWANaC17b2wO7MTt/xGmTrtO614Uv4fXmLjJhh8p4F/J
 yp3t7zsJsVXEmZ5fwhUARkHzPFSQHBbnRB0BS1rzj+9rvYy5FGxcJmA/2JWFq/+W3fSB
 3vZl6mzptsIkh+HGnSMIagSOdKxQY1GFS5n1BMNL5wRx4xjPnS2nVL5ESTkLLd1zovoO
 Dl28aHpApC9Ks09aRj3Jrr3KK1GJnK7mKyqI5ECEXWnHM/vTAZmtbdj9y6huxdybyvYU
 MwFZcTN+xsHcCxpUeAtuc/Gk+6aO61iknKqiHOK8ZEfiguWLRaDxE9WwPGCu+ehMNUbn
 mwRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JBuUU9YguZE61sauS+J8SEajdxsJ22GtHtPHR00xnwQ=;
 b=Qdz146DPIiQ2fDDfkHfgmO0jb3+fUocpOz4VMis3HJPneUdanxnbfWZClpfkGa0Oz1
 TmT+I5gvomO7Aiki4IS/se+2dTcGZyEV0uteKOHsxcsWk+qlgeZZeqJNaE10NXsDIjDl
 Pb1Vltfw+fn6tryeV2Dz0Po4do66Buec7L7SAZTsZ8JNdBgJTtX+9tiE8ZiPa0gDlHtt
 TUqMddJAYjJJ4NrbHoqNg+nR2ivffyR0tNj+xj22xtomhjJa4s6y1/zjXpeq1uAdPGHL
 21rWJsv2nKeLQAUGLCrvPyeK3lselun/qvWk24+s4/isjZpvXw7BYgyUFbib++6jKjCM
 eujQ==
X-Gm-Message-State: APjAAAWYExvtSxdolxUzO429+mm8CsJlZppGeW43/KHaDRT3EMtlatAG
 ZifFhDU7hFIWxJZVYb0Rk4U=
X-Google-Smtp-Source: APXvYqxgK0mJxO0cesg5dzA/VHClKjIV8UvSjUK/BmBRNn0pMgmfqfF4AHyys5c+xx6GizIFk2gDIg==
X-Received: by 2002:a17:906:4a12:: with SMTP id
 w18mr5231796eju.321.1580405131582; 
 Thu, 30 Jan 2020 09:25:31 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id ks2sm597103ejb.82.2020.01.30.09.25.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2020 09:25:31 -0800 (PST)
To: Sameer Pujar <spujar@nvidia.com>, perex@perex.cz, tiwai@suse.com,
 robh+dt@kernel.org
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-6-git-send-email-spujar@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <160bb2ca-89bb-0ecf-a334-0fac591b439a@gmail.com>
Date: Thu, 30 Jan 2020 20:25:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <1580380422-3431-6-git-send-email-spujar@nvidia.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 jonathanh@nvidia.com, viswanathl@nvidia.com, sharadg@nvidia.com,
 broonie@kernel.org, thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
Subject: Re: [alsa-devel] [PATCH v2 5/9] ASoC: tegra: add Tegra210 based
	AHUB driver
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

MzAuMDEuMjAyMCAxMzozMywgU2FtZWVyIFB1amFyINC/0LjRiNC10YI6Ci4uLgo+ICsjaW5jbHVk
ZSA8bGludXgvY2xrLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4KPiArI2luY2x1ZGUg
PGxpbnV4L21vZHVsZS5oPgo+ICsjaW5jbHVkZSA8bGludXgvb2ZfcGxhdGZvcm0uaD4KPiArI2lu
Y2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgo+ICsjaW5jbHVkZSA8bGludXgvcG1fcnVu
dGltZS5oPgo+ICsjaW5jbHVkZSA8bGludXgvcmVnbWFwLmg+Cgo+ICsjaW5jbHVkZSA8c291bmQv
c29jLmg+Cgo+ICsjaW5jbHVkZSAidGVncmEyMTBfYWh1Yi5oIgoKTml0OiBJJ2Qgc2VwYXJhdGUg
dGhlIHBlci1kaXJlY3RvcnkgaW5jbHVkZXMgd2l0aCBhIGJsYW5rIGxpbmUsIGxpa2UgaXQKZG9u
ZSBieSB0aGUgbW9zdCBvZiBleGlzdGluZyBkcml2ZXJzLCBmb3IgY29uc2lzdGVuY3kuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFp
bGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxz
YS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
