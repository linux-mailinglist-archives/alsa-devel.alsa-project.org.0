Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A2C757923
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 12:17:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0660FE76;
	Tue, 18 Jul 2023 12:17:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0660FE76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689675474;
	bh=WDTHrUsPymrO8nmJpxbWUaYcxSURmjngaV8JANnGwHU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hU5WnjR8lQWtoFgfgt+JBQ6l187ISNiLggVLilnBmFpi6cE3lGdk8alRRtUWpyhEy
	 PwR0MYkik5DSpPHl1Po4ZmFu+iapgujCaOLZWp4qjrziKNpJQsnXLKngRUsn4F+bUt
	 y/drOlK2MKTePuFdeGHNFHVWPDuCrk0m0yBR3sY8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A990EF805EA; Tue, 18 Jul 2023 12:14:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 11C43F805EA;
	Tue, 18 Jul 2023 12:14:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44652F8032D; Tue, 18 Jul 2023 11:03:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 50314F8027B
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 11:03:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50314F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=udPdgY2z
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3fbb07e7155so69885e9.0
        for <alsa-devel@alsa-project.org>;
 Tue, 18 Jul 2023 02:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689671024; x=1692263024;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m8n9C2+1ceNWNK8B4V9UVVJZlEjMqzJB4jI9qIEqfis=;
        b=udPdgY2zlwbUOAFnoZhByyU8vgrjQSKqYVoWpeYwTTEcBh60QZSUHkHTR2TmnE+J8X
         nGXedDrSNpEKQ4GNtJQXSrayaJ0yhnVD3C0qfV0yBtkKmM3Z7CcW6aLdPD1+rWqUVyy7
         71RbpRuMc/Ftn44khxLW6Tt2rQyMszQtdmKGfjcYaki2lRQd2Aboj5j47u9bF2cp1e7G
         fXgPaa2ZFblK37dvSO3hwsju3ccBrSrhGfWPXR9pHYAdiPMdM/2840t7b3YxCG/qjxjz
         UzXqcC4lu6ymABrCv02VKkwvSZoIsvC0Y8H+QR3GrNeY0Efi/+QIreDS0YBKfzKsr/UU
         pf/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689671024; x=1692263024;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m8n9C2+1ceNWNK8B4V9UVVJZlEjMqzJB4jI9qIEqfis=;
        b=jPBMQshicfJBMvn/KkA6pOnzFiMHrUs5geiHw9LzPQdpauaOKqOiIQyEIxjwHHbmTo
         q9FPwyhBXyN7aN67SKsUTM6iGXtkeogYBBkeb/+Xy1u4RFRsb9OGJc6DNJlvnR2o2bHE
         ZfZk65AlkqzxHUVr3wfHGAQYaHt6GPH4BD2Jr/FjztI36ITmZxR+4/vr5ylRzxPfeR0M
         I+2TMTKmUV3xo/G28m3J6pF1PhU2HWznkFMl367HoFUA1+5aCecC7HMNdfGXpep+VuCW
         BtucJWlIfWUK1qnN1WdG3Y5GLK1UQVfDSEDjstCtpURtluKy0M0mjIJNFZgy48Sc5Zhb
         xH0g==
X-Gm-Message-State: ABy/qLaD7t+IOrJVMNrUZwtaUACwVkrDUxK1zP8Lxi6gzSImH7OcHH6r
	taVAe30BYa2uL39y6SE2mAVjqd6bzlvbBJS2C90pNA==
X-Google-Smtp-Source: 
 APBJJlFwA4Qq1OA920SlL9F6tV87OJ6V11uYnPfKqCDWS5TF/aY8HmJaJScUFCm7V4x76DNnJSTEmZYpzziWwMiMdiU=
X-Received: by 2002:a05:600c:3ac5:b0:3f7:e463:a0d6 with SMTP id
 d5-20020a05600c3ac500b003f7e463a0d6mr83943wms.0.1689671024232; Tue, 18 Jul
 2023 02:03:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230718-asoc-topology-kunit-enable-v2-0-0ee11e662b92@kernel.org>
 <20230718-asoc-topology-kunit-enable-v2-2-0ee11e662b92@kernel.org>
In-Reply-To: 
 <20230718-asoc-topology-kunit-enable-v2-2-0ee11e662b92@kernel.org>
From: David Gow <davidgow@google.com>
Date: Tue, 18 Jul 2023 17:03:32 +0800
Message-ID: 
 <CABVgOSnWkjr8HfHCwf+qCe0gu1SA2pZHXbwpPd76sh=_ebd5Rg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] platform: Provide stubs for !HAS_IOMEM builds
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
	boundary="0000000000003521dc0600bf3140"
X-MailFrom: davidgow@google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4XPLQED7ZSQSO7RR4NKXGVOEDXHXPCU5
X-Message-ID-Hash: 4XPLQED7ZSQSO7RR4NKXGVOEDXHXPCU5
X-Mailman-Approved-At: Tue, 18 Jul 2023 10:14:06 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4XPLQED7ZSQSO7RR4NKXGVOEDXHXPCU5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--0000000000003521dc0600bf3140
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Jul 2023 at 08:30, Mark Brown <broonie@kernel.org> wrote:
>
> The various _ioremap_resource functions are not built when
> CONFIG_HAS_IOMEM is disabled but no stubs are provided. Given how
> widespread IOMEM usage is in drivers and how rare !IOMEM configurations
> are in practical use let's just provide some stubs so users will build
> without having to add explicit dependencies on IOMEM.
>
> The most likely use case is builds with UML for KUnit testing.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---

As with the previous patch, I'm all for this.

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David


>  include/linux/platform_device.h | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
> index b845fd83f429..7a41c72c1959 100644
> --- a/include/linux/platform_device.h
> +++ b/include/linux/platform_device.h
> @@ -63,6 +63,8 @@ extern struct resource *platform_get_mem_or_io(struct platform_device *,
>  extern struct device *
>  platform_find_device_by_driver(struct device *start,
>                                const struct device_driver *drv);
> +
> +#ifdef CONFIG_HAS_IOMEM
>  extern void __iomem *
>  devm_platform_get_and_ioremap_resource(struct platform_device *pdev,
>                                 unsigned int index, struct resource **res);
> @@ -72,6 +74,32 @@ devm_platform_ioremap_resource(struct platform_device *pdev,
>  extern void __iomem *
>  devm_platform_ioremap_resource_byname(struct platform_device *pdev,
>                                       const char *name);
> +#else
> +
> +static inline void __iomem *
> +devm_platform_get_and_ioremap_resource(struct platform_device *pdev,
> +                               unsigned int index, struct resource **res)
> +{
> +       return ERR_PTR(-EINVAL);
> +}
> +
> +
> +static inline void __iomem *
> +devm_platform_ioremap_resource(struct platform_device *pdev,
> +                              unsigned int index)
> +{
> +       return ERR_PTR(-EINVAL);
> +}
> +
> +static inline void __iomem *
> +devm_platform_ioremap_resource_byname(struct platform_device *pdev,
> +                                     const char *name)
> +{
> +       return ERR_PTR(-EINVAL);
> +}
> +
> +#endif
> +
>  extern int platform_get_irq(struct platform_device *, unsigned int);
>  extern int platform_get_irq_optional(struct platform_device *, unsigned int);
>  extern int platform_irq_count(struct platform_device *);
>
> --
> 2.39.2
>

--0000000000003521dc0600bf3140
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
MDIwAhABAz5xDls09r2CKyYRqnNbMA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCAm
7a8ArzfNH1yZUp5jfhdSe5s+mh/8cntVE8bqbNAVEzAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
MBwGCSqGSIb3DQEJBTEPFw0yMzA3MTgwOTAzNDRaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsG
CSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAGE7reL51zx706cJGn5Af
2SMgHXcE+A48pY/8PBmyvAqoVBh6kklIvq9+NZhOacgdVvledgrnmFxHEQKCf/pHyJ8sOgTyr0oI
/j258ZKH+mdY7ZOFBK/RVS5cPJuGer4rVpJCQvxw1x1ZCSjF2KmQ/pSQEQ3a1DWklHZCZUasNIMT
reIDRlxeI57pt08q+RHGfsH4tihFNrfU6Gf1+/uHfszmDj7GJYrcvfSpf+QmkKNb8B+q6176P9dE
LemavtHJZS8vyLYpfCmLPjM6ZA0s8yhkPh0ZME0CEKT6WQAG2OKd8OAM5/ZGtvY7g+UMLPIpV3Z4
mGN97Z7sW2YT+QgFaw==
--0000000000003521dc0600bf3140--
