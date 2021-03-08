Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A9C331838
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Mar 2021 21:12:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 221E918A3;
	Mon,  8 Mar 2021 21:11:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 221E918A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615234341;
	bh=3b4M6Qumy1b04EjeaKrklK8Y3gePITIP8ftF1aRZMMs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ncMBneusTw+tpq77TUZWfHHx4IZxhj/C6IG7CpFgI+PfQd3gF6rqULpZ9N5eu0guT
	 R1AZ7dCVbWsrqELJzqIQFhrrBM369LgL+3ps3c1NPkMds0/JvAAML6i68Czi0cvyDQ
	 j7Kb4Q49p1RwpsiGWePH24tJVa0mlgXjIXMRXu9I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70597F801ED;
	Mon,  8 Mar 2021 21:10:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D10AF801D8; Mon,  8 Mar 2021 21:10:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2819F800D0
 for <alsa-devel@alsa-project.org>; Mon,  8 Mar 2021 21:10:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2819F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com
 header.b="ht87OBxQ"
Received: by mail-pg1-x529.google.com with SMTP id v14so220295pgq.2
 for <alsa-devel@alsa-project.org>; Mon, 08 Mar 2021 12:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to;
 bh=Zus33LwbtXxraD8NSpvcdbhqIyWuNULbNrg6FqEl1ac=;
 b=ht87OBxQ34NudiK0/bDNI7jWPnNMJSCTjtHPHdRZpTYbmQ/p3CrmJZDg/IGwU5M0Kr
 Pm8+L46fcb758VTEgGV1NFreDqLMO63egXFXHUHfsBjKCnJrjcq7zqfmf24CFEJzyScW
 X+H8nLt6e8oGrDNZe02zPRn8LT+b/kYTTOVQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to;
 bh=Zus33LwbtXxraD8NSpvcdbhqIyWuNULbNrg6FqEl1ac=;
 b=hyeNpvAuHbnArURcLbbq4AvMsioSdCqn62RlIG+ctRD4MD0QbCGJhP7p9Mxx0DP/pB
 N1wP4fKUmrXKSdrsJmgxC/IvXBS/WmOYq1GzTMVUufD9/3eRZPY9Q4GQjc9z38fNVSFd
 AK8JfX0DDZyM2BGaX9mv03w7VedD1BpfBGDB5eMOazvDJycE/EYDLRtvnyfQJDoZMx2V
 X3RAEymj0hvXfF++Br6L4zMAUcnPF3uHE0fpBnfRGKuUyhOz9CNRj0wNGfcI39PxJsMk
 uShoLGxgHTQPBzzj+ubV3Mk7ja6xSl8jhZ/fKCtgvR/gZiCbLssd85Zv1rVZypL+suSC
 U8Zw==
X-Gm-Message-State: AOAM530U6Bd2Wh/NBhKVPm3IUHlUiFsQKoJHoXAl+bF81ZykB/HKaMmY
 K4aSzL3toDkQAswq3sIQwJkg4A==
X-Google-Smtp-Source: ABdhPJwI5uUEmo7YVa9wdMgCuV3dAIjzuKb5MtQnnxXquYUaa99ftRhNmZeClPAxCox8kL7VsbMHgw==
X-Received: by 2002:a05:6a00:2cd:b029:1f4:c3db:4191 with SMTP id
 b13-20020a056a0002cdb02901f4c3db4191mr8352176pft.71.1615234236329; 
 Mon, 08 Mar 2021 12:10:36 -0800 (PST)
Received: from lbrmn-lnxub113.ric.broadcom.net ([192.19.228.250])
 by smtp.gmail.com with ESMTPSA id x4sm3977153pfn.134.2021.03.08.12.10.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 12:10:35 -0800 (PST)
Subject: Re: [PATCH] ASoC: bcm: add missing call to of_node_put()
To: Yang Li <yang.lee@linux.alibaba.com>, perex@perex.cz
References: <1615187934-39505-1-git-send-email-yang.lee@linux.alibaba.com>
From: Scott Branden <scott.branden@broadcom.com>
Message-ID: <29d19f50-599f-fb9c-65e8-78fa5a30728f@broadcom.com>
Date: Mon, 8 Mar 2021 12:10:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1615187934-39505-1-git-send-email-yang.lee@linux.alibaba.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="000000000000ea696f05bd0c069a"
Cc: alsa-devel@alsa-project.org, sbranden@broadcom.com, lgirdwood@gmail.com,
 rjui@broadcom.com, tiwai@suse.com, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org
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

--000000000000ea696f05bd0c069a
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Yang,

On 2021-03-07 11:18 p.m., Yang Li wrote:
> In one of the error paths of the for_each_child_of_node() loop,
> add missing call to of_node_put().
> 
> Fix the following coccicheck warning:
> ./sound/soc/bcm/cygnus-ssp.c:1346:1-33: WARNING: Function
> "for_each_available_child_of_node" should have of_node_put() before
> return around line 1352.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  sound/soc/bcm/cygnus-ssp.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/bcm/cygnus-ssp.c b/sound/soc/bcm/cygnus-ssp.c
> index 6e634b4..aa16a23 100644
> --- a/sound/soc/bcm/cygnus-ssp.c
> +++ b/sound/soc/bcm/cygnus-ssp.c
> @@ -1348,8 +1348,10 @@ static int cygnus_ssp_probe(struct platform_device *pdev)
>  					&cygnus_ssp_dai[active_port_count]);
>  
>  		/* negative is err, 0 is active and good, 1 is disabled */
> -		if (err < 0)
> +		if (err < 0) {
> +			of_node_put(child_node);
If such is needed in probe what about the other child_nodes in for_each_child_of_node loop that have already been parsed and succeeded.  Do they need additional cleanup as well?
>  			return err;
> +		}
>  		else if (!err) {
>  			dev_dbg(dev, "Activating DAI: %s\n",
>  				cygnus_ssp_dai[active_port_count].name);
> 


--000000000000ea696f05bd0c069a
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIQcAYJKoZIhvcNAQcCoIIQYTCCEF0CAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
gg3HMIIFDTCCA/WgAwIBAgIQeEqpED+lv77edQixNJMdADANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA5MTYwMDAwMDBaFw0yODA5MTYwMDAwMDBaMFsxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIEdDQyBS
MyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
vbCmXCcsbZ/a0fRIQMBxp4gJnnyeneFYpEtNydrZZ+GeKSMdHiDgXD1UnRSIudKo+moQ6YlCOu4t
rVWO/EiXfYnK7zeop26ry1RpKtogB7/O115zultAz64ydQYLe+a1e/czkALg3sgTcOOcFZTXk38e
aqsXsipoX1vsNurqPtnC27TWsA7pk4uKXscFjkeUE8JZu9BDKaswZygxBOPBQBwrA5+20Wxlk6k1
e6EKaaNaNZUy30q3ArEf30ZDpXyfCtiXnupjSK8WU2cK4qsEtj09JS4+mhi0CTCrCnXAzum3tgcH
cHRg0prcSzzEUDQWoFxyuqwiwhHu3sPQNmFOMwIDAQABo4IB2jCCAdYwDgYDVR0PAQH/BAQDAgGG
MGAGA1UdJQRZMFcGCCsGAQUFBwMCBggrBgEFBQcDBAYKKwYBBAGCNxQCAgYKKwYBBAGCNwoDBAYJ
KwYBBAGCNxUGBgorBgEEAYI3CgMMBggrBgEFBQcDBwYIKwYBBQUHAxEwEgYDVR0TAQH/BAgwBgEB
/wIBADAdBgNVHQ4EFgQUljPR5lgXWzR1ioFWZNW+SN6hj88wHwYDVR0jBBgwFoAUj/BLf6guRSSu
TVD6Y5qL3uLdG7wwegYIKwYBBQUHAQEEbjBsMC0GCCsGAQUFBzABhiFodHRwOi8vb2NzcC5nbG9i
YWxzaWduLmNvbS9yb290cjMwOwYIKwYBBQUHMAKGL2h0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5j
b20vY2FjZXJ0L3Jvb3QtcjMuY3J0MDYGA1UdHwQvMC0wK6ApoCeGJWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vcm9vdC1yMy5jcmwwWgYDVR0gBFMwUTALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgEo
CjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzAN
BgkqhkiG9w0BAQsFAAOCAQEAdAXk/XCnDeAOd9nNEUvWPxblOQ/5o/q6OIeTYvoEvUUi2qHUOtbf
jBGdTptFsXXe4RgjVF9b6DuizgYfy+cILmvi5hfk3Iq8MAZsgtW+A/otQsJvK2wRatLE61RbzkX8
9/OXEZ1zT7t/q2RiJqzpvV8NChxIj+P7WTtepPm9AIj0Keue+gS2qvzAZAY34ZZeRHgA7g5O4TPJ
/oTd+4rgiU++wLDlcZYd/slFkaT3xg4qWDepEMjT4T1qFOQIL+ijUArYS4owpPg9NISTKa1qqKWJ
jFoyms0d0GwOniIIbBvhI2MJ7BSY9MYtWVT5jJO3tsVHwj4cp92CSFuGwunFMzCCA18wggJHoAMC
AQICCwQAAAAAASFYUwiiMA0GCSqGSIb3DQEBCwUAMEwxIDAeBgNVBAsTF0dsb2JhbFNpZ24gUm9v
dCBDQSAtIFIzMRMwEQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpHbG9iYWxTaWduMB4XDTA5
MDMxODEwMDAwMFoXDTI5MDMxODEwMDAwMFowTDEgMB4GA1UECxMXR2xvYmFsU2lnbiBSb290IENB
IC0gUjMxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzARBgNVBAMTCkdsb2JhbFNpZ24wggEiMA0GCSqG
SIb3DQEBAQUAA4IBDwAwggEKAoIBAQDMJXaQeQZ4Ihb1wIO2hMoonv0FdhHFrYhy/EYCQ8eyip0E
XyTLLkvhYIJG4VKrDIFHcGzdZNHr9SyjD4I9DCuul9e2FIYQebs7E4B3jAjhSdJqYi8fXvqWaN+J
J5U4nwbXPsnLJlkNc96wyOkmDoMVxu9bi9IEYMpJpij2aTv2y8gokeWdimFXN6x0FNx04Druci8u
nPvQu7/1PQDhBjPogiuuU6Y6FnOM3UEOIDrAtKeh6bJPkC4yYOlXy7kEkmho5TgmYHWyn3f/kRTv
riBJ/K1AFUjRAjFhGV64l++td7dkmnq/X8ET75ti+w1s4FRpFqkD2m7pg5NxdsZphYIXAgMBAAGj
QjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBSP8Et/qC5FJK5N
UPpjmove4t0bvDANBgkqhkiG9w0BAQsFAAOCAQEAS0DbwFCq/sgM7/eWVEVJu5YACUGssxOGhigH
M8pr5nS5ugAtrqQK0/Xx8Q+Kv3NnSoPHRHt44K9ubG8DKY4zOUXDjuS5V2yq/BKW7FPGLeQkbLmU
Y/vcU2hnVj6DuM81IcPJaP7O2sJTqsyQiunwXUaMld16WCgaLx3ezQA3QY/tRG3XUyiXfvNnBB4V
14qWtNPeTCekTBtzc3b0F5nCH3oO4y0IrQocLP88q1UOD5F+NuvDV0m+4S4tfGCLw0FREyOdzvcy
a5QBqJnnLDMfOjsl0oZAzjsshnjJYS8Uuu7bVW/fhO4FCU29KNhyztNiUGUe65KXgzHZs7XKR1g/
XzCCBU8wggQ3oAMCAQICDH2hdImkqeI7h1IaTzANBgkqhkiG9w0BAQsFADBbMQswCQYDVQQGEwJC
RTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTExMC8GA1UEAxMoR2xvYmFsU2lnbiBHQ0MgUjMg
UGVyc29uYWxTaWduIDIgQ0EgMjAyMDAeFw0yMTAyMjIxNDA5MDJaFw0yMjA5MjIxNDMxMTRaMIGQ
MQswCQYDVQQGEwJJTjESMBAGA1UECBMJS2FybmF0YWthMRIwEAYDVQQHEwlCYW5nYWxvcmUxFjAU
BgNVBAoTDUJyb2FkY29tIEluYy4xFjAUBgNVBAMTDVNjb3R0IEJyYW5kZW4xKTAnBgkqhkiG9w0B
CQEWGnNjb3R0LmJyYW5kZW5AYnJvYWRjb20uY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIB
CgKCAQEAtKitgySOPXrCfmgJJ/6N4Bq2PYQ9C7pbBbEOgcLdGZyOHK9MJW3fcf8NXplv3OfFCQzp
rm9QWjKvH806lCzDhSKgAg+vro9Alv6BTl7wBdSVpgFsV/Tl+kbDfeBxjE/AwOW+WNGIPJLH4WCo
MMkaRzH4Lg/8h9DnzxR46++4CqLY4KQQ151a+4Ojb/u/YlVGYlZa/jmTEgk3It8dzv54hZ/UoZg1
cRe0CRXA7ypOJSgxO/nOOyQoaJxT7CGg1npOeSpPjEuc3fE4xum3l0nvU85hj6MlKZu43hokdBh0
D0nLyyhEwlR3AC/msdff/UGbM/JR9vk812RP4m/aNWZFJwIDAQABo4IB2zCCAdcwDgYDVR0PAQH/
BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3VyZS5nbG9i
YWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEGCCsGAQUF
BzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAy
MDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xv
YmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6hjhodHRw
Oi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNybDAlBgNV
HREEHjAcgRpzY290dC5icmFuZGVuQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAf
BgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUOhjEpl04Sz9dh5MI82E1
V39lM/owDQYJKoZIhvcNAQELBQADggEBAA7Rlypx/esz/iq1yA4+KW7uwV/aBY344BWcXt6I+SNK
VwFBgFWfLj5vaEud9TVv2fPSiaHJo0umemOJk+43QD+bsoqmgcFXd21PrOt7Jjs+jjVED9VC5kJq
S4NNKUkS+BqijJwSegtVygrc/atrIlJbjI21q4qpemUo5fgwqCNm++BmBGTI8yA09vtGSNDRN42k
lLX9hl3iEj5SBgkQqCbbnoE+ZjjKfqt7ED166WhgyQWNrl39yLcvLj+JRUB3RuvXKZjH0NQEEBII
wZBDSkyneykLt3CBNIhSCTxKM6OWxVp936ALSa5K9FNy00TeWSpokR6NmzaW8VD/EjTgvqAxggJt
MIICaQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYD
VQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgx9oXSJpKniO4dS
Gk8wDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIC/f+OcDcOVaPLl4K9t/MaroSruV
GrqkQW1Am3/qYhBdMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIx
MDMwODIwMTAzNlowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFl
AwQCATANBgkqhkiG9w0BAQEFAASCAQAM19OFMlX+qUMAxby92eRMUyieZpDwb9ip/yJ9fZvqLTjp
7VPFILN8Y3eEdkpryUcllLksktguBeR+M4OvWn852cqmXvSmplLAXLlJzRoAvUx2hWsnP+2f8t0T
EbGlKUOMtUXSLfoarCyb4Vz2Y/B0CSLr7WumQGel0VwL3wiPWyoHIYmZD19z0m9UTFlVpiYXJ+8j
d/X67hLHceVP84iKABDshhYZMk0gAI3mum1VBVzt2Xm/w4HA8h+yxNbi9M2Ip8Gh5a3hdDc4YB6j
t9pE2HVyjBuqbZR3K1wI+JD9FfBTDuwigkjqAuo7ghe70oj4D0YKjVpNw9Eco1RoMjGc
--000000000000ea696f05bd0c069a--
