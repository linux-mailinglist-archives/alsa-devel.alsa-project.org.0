Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7570E757925
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 12:18:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2ED7E74;
	Tue, 18 Jul 2023 12:17:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2ED7E74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689675487;
	bh=VL1j3O0Q04VgiaPuaZDUXw3HMOuYnE00jHz1oEj0dlk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RXq3tUxIVxZBAjIaktr2Dm35gNY4dKEjWuf309x4d2+BRbMsDtRLKZYIOqtLp/twP
	 grMEFbnxrBUi31qWU/EQdZTlz9bBKj+oVSJCYy0Q2rMusYRmXITArcQt2kpdM1KS2M
	 z40GZAiNMqoKCo3griq0nnzZAjw+gmHPP2jBFGoM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 793F2F805F8; Tue, 18 Jul 2023 12:14:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 16ED9F805F4;
	Tue, 18 Jul 2023 12:14:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32ECEF8032D; Tue, 18 Jul 2023 11:03:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F19B2F804DA
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 11:03:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F19B2F804DA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=UocW8hid
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3fbd200d354so47195e9.1
        for <alsa-devel@alsa-project.org>;
 Tue, 18 Jul 2023 02:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689671028; x=1692263028;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0EvPzuVM27XFUaw33jSWEX5QGKMhCOrUck8/cGtVCmc=;
        b=UocW8hid+w5go/q3O2K4oXnUhSvMi2hOp596znx2lNj493eaJM+wl1m7itit9gm7FE
         91LpqkH77iX77PG6JW2Q6IwjbEBfbyf6qnC498nOl36WCkVBpkfAHWbe2IN8fK5xCt0S
         Xni/TaPYEvOSVhdyBY5yjc49aQ0Oz3+D6DbaOeN8OoRHtqVFjjKqu1gj08gjTqyRa3ih
         zagsCcEY1oJeAIw5Ixqi/V0PvzC3gPTnreSf+dLe8MXDGzu0AyLwimR0XG2sea0CESR8
         +tYq5Pe1MkufJgoGSWTWL64d/KWve929AJs5qrYG/sOisjvaq3S2o6TdR1rqPNl6WsWq
         ZNPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689671028; x=1692263028;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0EvPzuVM27XFUaw33jSWEX5QGKMhCOrUck8/cGtVCmc=;
        b=JI+5G14wIptneIYrgOVN9cBvY35kbN+fM2WRAL0kVY4G6WHcHcxoGzfr1oSGf1tBiR
         AUdCS2BBQbmykArG92rNB4WSc10U5NxOzbbJiYIRwQjfPSOSYrDLokt64bbJ3b+61EPR
         J3HMDi9odOgStnt4WiEZidr6iQvYSsLyP6QnRIGnq+C+HABnrrgM09tWYYXA33WKUbHX
         wM3v89lYKqxsh9pepCaE9jst0PVCqFkHzKzKLD9D00aw/DLl98fQ6Fk87wJhohBBb3HM
         48yLGBE+J8Ad7QVHoMG33Kl76KfzYZ/zEKH/OQq1RMwmlvwfYmmukvIbLalPBrynEUQ3
         7GuQ==
X-Gm-Message-State: ABy/qLZCuqdLTWREJybd/GzgBuzKUgpD2rv/Ed4U3GYb3u/1zVtdhR39
	wtUP3FuFd+JKcEsRI/yAZbchPwRJE/HnCdtXsb/5hg==
X-Google-Smtp-Source: 
 APBJJlGosrwaYRnxxumaPEki54Xk1ftUTjhUOX5RuvDKnY/mKfUFiDpEwVbFjqcH2h40f0EaaXJpvYotzJA3IVBbUG4=
X-Received: by 2002:a05:600c:3c92:b0:3fc:75d:8f85 with SMTP id
 bg18-20020a05600c3c9200b003fc075d8f85mr84492wmb.6.1689671028113; Tue, 18 Jul
 2023 02:03:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230718-asoc-topology-kunit-enable-v2-0-0ee11e662b92@kernel.org>
 <20230718-asoc-topology-kunit-enable-v2-3-0ee11e662b92@kernel.org>
In-Reply-To: 
 <20230718-asoc-topology-kunit-enable-v2-3-0ee11e662b92@kernel.org>
From: David Gow <davidgow@google.com>
Date: Tue, 18 Jul 2023 17:03:36 +0800
Message-ID: 
 <CABVgOS=W81BCVWFg7OPiu4i5pJ9_4jSu+rKG7eY6TDMB2KQ3nw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] ALSA: Enable build with UML
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Brendan Higgins <brendan.higgins@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
	alsa-devel@alsa-project.org, linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256;
	boundary="0000000000006f2c230600bf31aa"
X-MailFrom: davidgow@google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: L4ZRI2BO6V5RQWMNASWWBW344RZEK23S
X-Message-ID-Hash: L4ZRI2BO6V5RQWMNASWWBW344RZEK23S
X-Mailman-Approved-At: Tue, 18 Jul 2023 10:14:06 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L4ZRI2BO6V5RQWMNASWWBW344RZEK23S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--0000000000006f2c230600bf31aa
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Jul 2023 at 08:30, Mark Brown <broonie@kernel.org> wrote:
>
> In order to facilitate testing using KUnit allow ALSA to build with UML,
> it's not super useful at runtime but that's a user problem rather than
> an actual dependency.  The apparent reason for the dependency was the
> widespread use of iomem APIs in ALSA drivers, earlier patches in this
> series have provided stubs for these APIs so that there are no build
> time issues even without individual drivers having IOMEM dependencies
> added.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---

This works well here, and I'd love to see it go through. I'll leave it
to the ALSA folks in case there are other issues with UML they're
worried about, though.

Tested-by: David Gow <davidgow@google.com>

Cheers,
-- David


>  sound/Kconfig | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/sound/Kconfig b/sound/Kconfig
> index 0ddfb717b81d..f0e15822e858 100644
> --- a/sound/Kconfig
> +++ b/sound/Kconfig
> @@ -39,8 +39,6 @@ config SOUND_OSS_CORE_PRECLAIM
>
>  source "sound/oss/dmasound/Kconfig"
>
> -if !UML
> -
>  menuconfig SND
>         tristate "Advanced Linux Sound Architecture"
>         help
> @@ -103,8 +101,6 @@ source "sound/virtio/Kconfig"
>
>  endif # SND
>
> -endif # !UML
> -
>  endif # SOUND
>
>  config AC97_BUS
>
> --
> 2.39.2
>

--0000000000006f2c230600bf31aa
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIPnwYJKoZIhvcNAQcCoIIPkDCCD4wCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ggz5MIIEtjCCA56gAwIBAgIQeAMYYHb81ngUVR0WyMTzqzANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA3MjgwMDAwMDBaFw0yOTAzMTgwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFIzIFNNSU1FIENBIDIwMjAwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCvLe9xPU9W
dpiHLAvX7kFnaFZPuJLey7LYaMO8P/xSngB9IN73mVc7YiLov12Fekdtn5kL8PjmDBEvTYmWsuQS
6VBo3vdlqqXZ0M9eMkjcKqijrmDRleudEoPDzTumwQ18VB/3I+vbN039HIaRQ5x+NHGiPHVfk6Rx
c6KAbYceyeqqfuJEcq23vhTdium/Bf5hHqYUhuJwnBQ+dAUcFndUKMJrth6lHeoifkbw2bv81zxJ
I9cvIy516+oUekqiSFGfzAqByv41OrgLV4fLGCDH3yRh1tj7EtV3l2TngqtrDLUs5R+sWIItPa/4
AJXB1Q3nGNl2tNjVpcSn0uJ7aFPbAgMBAAGjggGKMIIBhjAOBgNVHQ8BAf8EBAMCAYYwHQYDVR0l
BBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBIGA1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFHzM
CmjXouseLHIb0c1dlW+N+/JjMB8GA1UdIwQYMBaAFI/wS3+oLkUkrk1Q+mOai97i3Ru8MHsGCCsG
AQUFBwEBBG8wbTAuBggrBgEFBQcwAYYiaHR0cDovL29jc3AyLmdsb2JhbHNpZ24uY29tL3Jvb3Ry
MzA7BggrBgEFBQcwAoYvaHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvcm9vdC1y
My5jcnQwNgYDVR0fBC8wLTAroCmgJ4YlaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9yb290LXIz
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
9IGQSBx2i4m+hGXJpET+MEwGA1UdIARFMEMwQQYJKwYBBAGgMgEoMDQwMgYIKwYBBQUHAgEWJmh0
dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQCMAAwgZoGCCsG
AQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9jYS9n
c2F0bGFzcjNzbWltZWNhMjAyMDBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5nbG9iYWxzaWdu
LmNvbS9jYWNlcnQvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3J0MB8GA1UdIwQYMBaAFHzMCmjXouse
LHIb0c1dlW+N+/JjMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20v
Y2EvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3JsMA0GCSqGSIb3DQEBCwUAA4IBAQCRI3Z4cAidgFcv
Usqdz765x6KMZSfg/WtFrYg8ewsP2NpCxVM2+EhPyyEQ0k0DhtzdtGoI/Ug+jdFDyCKB9P2+EPLh
iMjMnFILp7Zs4r18ECHlvZuDZfH9m0BchXIxu5jLIuQyKUWrCRDZZEDNr510ZhhVfYSFPA8ms1nk
jyzYFOHYQyv5IfML/3IBFKlON5OZa+V8EZYULYcNkp03DdWglafj7SXZ1/XgAbVYrC381UvrsYN8
jndVvoa1GWwe+NVlIIK7Q3uAjV3qLEDQpaNPg1rr0oAn6YmvTccjVMqj2YNwN+RHhKNzgRGxY5ct
FaN+8fXZhRhpv3bVbAWuPZXoMYICajCCAmYCAQEwaDBUMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQ
R2xvYmFsU2lnbiBudi1zYTEqMCgGA1UEAxMhR2xvYmFsU2lnbiBBdGxhcyBSMyBTTUlNRSBDQSAy
MDIwAhABAz5xDls09r2CKyYRqnNbMA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCAT
YfhAoJw9f0lI+iJkcuGhd1aveq7AEBmqZayrBjdU1DAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
MBwGCSqGSIb3DQEJBTEPFw0yMzA3MTgwOTAzNDhaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsG
CSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAQcunZtkOLIfnWXsLHViO
6oe/HoLmms6VW1vlD8CIEiv4FMvaJFMLPpiUrnGNYIlRX2zkoB0UtXr6rlOpETZWvG1Qt3js4LPq
VUL74p5ZqgQ6kx96+MrjNg8rmL4XIQ/DkpEFO2agp2m2Mc0ywKyZj87Oyj4wsGEbwF5D7EaAdy8a
8KNrkdpkm64KrUaHt901kDS7djh8BzNZbk9Cwx1mhR09XixRgBsb9Ul4Tf8o+G6UOxUjko8EmKWx
K6HdqB/mXek7EZZBo4vl//ztm8KIAShnL9RvUX/uquf0GbqA215GLw5tb7H5mZXuyE/uO7rfbZ8E
bkrgMgUdUy1OSabeVQ==
--0000000000006f2c230600bf31aa--
