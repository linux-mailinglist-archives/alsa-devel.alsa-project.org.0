Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 966D325DD4
	for <lists+alsa-devel@lfdr.de>; Wed, 22 May 2019 07:55:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 249DC16FF;
	Wed, 22 May 2019 07:54:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 249DC16FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558504538;
	bh=NYls9r0ujZzLbrT6fZxGWuko5MtuFowB+pkZ/UM+7SY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AlJo8cOLIq+TWVUDcGRdK5YwwTiMnAKd6GF4LgLlq4R+TJ178NCd/bo8h3IaZxmqC
	 jZTFmu2QKTF0T+ggnV4uw6Ib2Ao5+n64J6ckFOUEExYg1pcB4x25lqlaM0QJEnNb65
	 zs1uoOsvF3D/N/NJLf7DsGFWrvYROHVT6YESW88c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C43BF89718;
	Wed, 22 May 2019 07:53:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09E8CF8963E; Wed, 22 May 2019 07:53:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CE98F89633
 for <alsa-devel@alsa-project.org>; Wed, 22 May 2019 07:53:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CE98F89633
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="nSudSti3"
Received: by mail-wm1-x344.google.com with SMTP id t5so770224wmh.3
 for <alsa-devel@alsa-project.org>; Tue, 21 May 2019 22:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=5gjsqjo7IX+MYjphdtIkAMMrTXCVUSggkJvGSotJJTQ=;
 b=nSudSti3cbNq95ZgFSRAecS+O+iIU59MPEEHCRSVybrADbuZzF5mtNDtpEcL7L4jDG
 Gf2k3iVfd09ImO2tUauH5r78a1zIQCy/yZhwx4YCUEfytpwf5TrHPC0C5EjZpvU7Tx1e
 GIsjjkObImxGfY4Z/eqY7Z2npXSGGSEfzsM29qYIVx+haNOP9fMk6BoppQE6peAjmKG1
 I6VrmS5zC9uQdJ2C5QV1x+AJ2kqL5JgdkWgHolDkckJRu+IdYvX2atO2zp21hTxH5eQW
 Ik5Fn1RalD1gDMXJYyKQjL823oybPJay4I5m7RyRy2EXVUEb29QDjg0BlcYTTAT7wjEJ
 OByg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=5gjsqjo7IX+MYjphdtIkAMMrTXCVUSggkJvGSotJJTQ=;
 b=UU7bqfFDuK2uNvczas97mOVPXNMm966TGTUFKKY+Bj78KJQUl09g6GX9HlpUUWeUhs
 0Z3IqAKxUhNYGOv0Ke+UW3j9kWqyIOP2pc25/VvVT8yrcgIShYR62P37Cicjvu6rRkRl
 HXvZOkcnIV7MQaoAB7ZyT2QQnkYlabSjsKJPtthcH/Jc5Ix3U3E1+g4yU+0u+lYRJW29
 kzoa4VgrU5MDqKLHrQcOEzIqRisELkJiP+Eqta8GCJcyFqnsVGEaYolQ1BsbGtb58CJ8
 ra40kA3Da6rY7d+YZaCeAioMVjZTatoITAj71jm4gyZo2k5ZBiyiWSqiOeQJWCrcgJG7
 8hZQ==
X-Gm-Message-State: APjAAAUQQ8Ma6sOmWleKO6qBPoJo4Sun9eCUPUa+SETR2jP4fVOQjv8m
 DPmV73oos2fZMRFQ6VOeatjgCw==
X-Google-Smtp-Source: APXvYqw0VeHmbRFUaVBdAsWdfo5a4BUlWDZQeqyEOri4Oo8A4cuG+M7gb+hFRspLGJE99Uxe95GC7Q==
X-Received: by 2002:a1c:f111:: with SMTP id p17mr5741383wmh.62.1558504405746; 
 Tue, 21 May 2019 22:53:25 -0700 (PDT)
Received: from dell ([2.27.167.43])
 by smtp.gmail.com with ESMTPSA id y4sm3465996wmj.20.2019.05.21.22.53.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 21 May 2019 22:53:25 -0700 (PDT)
Date: Wed, 22 May 2019 06:53:23 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Fabien Lahoudere <fabien.lahoudere@collabora.com>
Message-ID: <20190522055323.GD4574@dell>
References: <20190509211353.213194-1-gwendal@chromium.org>
 <2741579da03893d2d4e7ad7f5fc42a506a82f380.camel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2741579da03893d2d4e7ad7f5fc42a506a82f380.camel@collabora.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Gwendal Grignou <gwendal@chromium.org>, alsa-devel@alsa-project.org,
 linux-iio@vger.kernel.org, tiwai@suse.com, linux-kernel@vger.kernel.org,
 groeck@chromium.org, broonie@kernel.org, enric.balletbo@collabora.com,
 bleung@chromium.org, jic23@kernel.org, cychiang@chromium.org
Subject: Re: [alsa-devel] [PATCH v3 00/30] Update cros_ec_commands.h
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

T24gVHVlLCAyMSBNYXkgMjAxOSwgRmFiaWVuIExhaG91ZGVyZSB3cm90ZToKCj4gTGUgamV1ZGkg
MDkgbWFpIDIwMTkgw6AgMTQ6MTMgLTA3MDAsIEd3ZW5kYWwgR3JpZ25vdSBhIMOpY3JpdCA6Cj4g
PiBUaGUgaW50ZXJmYWNlIGJldHdlZW4gQ3Jvc0VDIGVtYmVkZGVkIGNvbnRyb2xsZXIgYW5kIHRo
ZSBob3N0LAo+ID4gZGVzY3JpYmVkIGJ5IGNyb3NfZWNfY29tbWFuZHMuaCwgYXMgZGl2ZXJnZWQg
ZnJvbSB3aGF0IHRoZSBlbWJlZGRlZAo+ID4gY29udHJvbGxlciByZWFsbHkgc3VwcG9ydC4KPiA+
IAo+ID4gVGhlIHNvdXJjZSBvZiB0aHJ1dGggaXMgYXQKPiA+IGh0dHBzOi8vY2hyb21pdW0uZ29v
Z2xlc291cmNlLmNvbS9jaHJvbWl1bW9zL3BsYXRmb3JtL2VjLysvbWFzdGVyL2luY2x1ZGUvZWNf
Y29tbWFuZHMuaAo+ID4gCj4gPiBUaGF0IGluY2x1ZGUgZmlsZSBpcyBjb252ZXJ0ZWQgdG8gcmVt
b3ZlIEFDUEkgYW5kIEVtYmVkZGVkIG9ubHkgY29kZS4KPiAKPiBIaSwgCj4gCj4gSSByZXZpZXdl
ZCBwYXRjaGVzIG9mIHRoZSBzZXJpZXMgYW5kIHRoZXkgbG9va3MgZ29vZCB0byBtZS4KPiAKPiBS
ZXZpZXdlZC1ieTogRmFiaWVuIExhaG91ZGVyZSA8ZmFiaWVuLmxhaG91ZGVyZUBjb2xsYWJvcmEu
Y29tPgoKVGhhbmtzIEZhYmllbi4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KTGluYXJvIFNl
cnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJl
IGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwg
bWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4u
YWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
