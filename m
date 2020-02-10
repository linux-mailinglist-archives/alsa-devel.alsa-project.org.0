Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0200158197
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 18:42:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B8C81671;
	Mon, 10 Feb 2020 18:41:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B8C81671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581356569;
	bh=0F8g8NbXBjHrrwA0zp0RBl6hM2GS6/RkPFck/xjn7Qo=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PWP0cZvvYAy9GACpLCXguOlw8UwEPeN/VRnlFV9xzefMk8nvpLwbZrw6hbMwwJZRU
	 SZLxJFYSyYoBbKh4KGcSp939/vR8d+uYxeWNece9h9f7iz9j+XY80koNS+a4ueYMQT
	 4YddEMHl9ZE8N7vL4EYue/Y98ZtJ3H45kXK/gYzI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 370C6F8014F;
	Mon, 10 Feb 2020 18:41:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48458F80157; Mon, 10 Feb 2020 18:41:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8721F800FD
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 18:41:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8721F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="FQ5SjqjI"
Received: by mail-wr1-x42c.google.com with SMTP id y11so8870589wrt.6
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 09:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3gIUz/+oLLuaq19t30k8Jz+s5aA2PVpnAzXQO10cT/Y=;
 b=FQ5SjqjI8mESjcAV3hk0fQYB1DIjyI3CqJt/Aw53H9qwncQV+lCBRMSjQ9ez4AuPS9
 TO7MkvREuIQeW/8B7MTc602yDlTEDGJeJW2aW15lFEJSUDTv2cwNH3coJVWJL3uztvdQ
 8eHriud893T21Xf6LGypKFQcYCVPSKUIVcn9fWTNO9j2jF7Gi+iZQB+cDdbI9YZ6YoZP
 CEWpAt/4hPKW5geh6ytp1UpQN70S1ciZz061CDJL/aboGKgm4pnl8PidJ06uNY+3yli9
 DN8AeGMPwJZDOSEWRrpTIa0PI6WclosM+d3+AeBamTiIZPLsF35gyimD/PAgQIksG9ab
 r2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3gIUz/+oLLuaq19t30k8Jz+s5aA2PVpnAzXQO10cT/Y=;
 b=Hzq3mWdSPSF+/fxma27IakdNCPLxqOLW+3YxSZsTVuD9EnI0ztjSi3NUti2dc7ewfu
 zHHyOr2GLmOjDXpmjt8KC/XqL7kxjZ9pHpNkGymjf/SCSgnkcOXmJKi0Xahbs48y8PjZ
 QtW0gOMKbVpkIn7T4sw+IdjPATPzkPGRzwOGItT0y8ZtbjL1yUENqlb3pTZP9JNr6Jug
 x6B/moDDzMLnVnOI7kE8LvasXNkvdnYogFKznTCmYSAG9x8MzgIMNEYncKzIu/a9OcfM
 x96QmiAJ4SfVq19r3x8+ZShvA0a94Gt68JTUPQBjNyVytKf/vHt7vTGnEJR7RkjkW8Ae
 f2RA==
X-Gm-Message-State: APjAAAX4QNoObZt4hf+EnMjPdioZZ0xFlPUn5EKMfQPYngOT4Z831ljt
 Cwb5vMyRua4e0R4CTlqwDSaVNg==
X-Google-Smtp-Source: APXvYqwbPVn4r/e2i10UW5NrTzU1jT70XhhtfiutTlrnJyFJyV3h+DHyidgLZwaetvsInEsC+lSh5Q==
X-Received: by 2002:a5d:6292:: with SMTP id k18mr3078880wru.256.1581356461456; 
 Mon, 10 Feb 2020 09:41:01 -0800 (PST)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id o15sm1401166wra.83.2020.02.10.09.41.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Feb 2020 09:41:00 -0800 (PST)
To: Adam Serbinski <adam@serbinski.com>
References: <20200207205013.12274-1-adam@serbinski.com>
 <20200209154748.3015-1-adam@serbinski.com>
 <20200209154748.3015-4-adam@serbinski.com>
 <d0437f6d-84c8-e1cd-b6f5-c1009e00245d@linaro.org>
 <616e3042f46cb7f052fc71e0ba4919a2@serbinski.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <5464ab87-f711-4aa6-3f22-f27bf4819998@linaro.org>
Date: Mon, 10 Feb 2020 17:40:59 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <616e3042f46cb7f052fc71e0ba4919a2@serbinski.com>
Content-Language: en-US
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mark Brown <broonie@kernel.org>, Andy Gross <agross@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2 3/8] ASoC: qdsp6: q6afe-dai: add support
 to pcm port dais
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

CgpPbiAxMC8wMi8yMDIwIDE3OjIyLCBBZGFtIFNlcmJpbnNraSB3cm90ZToKPj4+Cj4+Cj4+IFdo
eSBhcmUgd2UgYWRkaW5nIGV4YWN0bHkgZHVwbGljYXRlIGZ1bmN0aW9uIG9mIHE2YWZlX21pMnNf
c2V0X3N5c2NsayAKPj4gaGVyZT8KPiAKPiBJdCBpc24ndCBhbiBleGFjdCBkdXBsaWNhdGUuCj4g
Cj4gVGhlIHJlYXNvbiBJIHNwbGl0IG9mZiB0aGUgbmV3IGZ1bmN0aW9uIGlzIGJlY2F1c2UgdGhl
IGNsb2NrIElEcyBmb3IgUENNCj4gb3ZlcmxhcC9kdXBsaWNhdGUgdGhlIGNsb2NrIElEcyBmb3Ig
VERNLCB5ZXQgdGhlIHBhcmFtZXRlcnMgdG8KPiBxNmFmZV9wb3J0X3NldF9zeXNjbGsgYXJlIG5v
dCB0aGUgc2FtZSBmb3IgUENNIGFuZCBURE0uCj4gCndlIHNob3VsZCBiZSBhYmxlIHRvIHVzZSBk
YWktPmlkIHRvIG1ha2UgdGhhdCBkZWNpc2lvbi4KCi0tc3JpbmkKCgoKCj4gCj4+PiDCoCArwqDC
oMKgIFNORF9TT0NfREFQTV9BSUZfSU4oIlFVQVRfUENNX1JYIiwgTlVMTCwKPj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMCwgMCwgMCwgMCksCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2Et
ZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
