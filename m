Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C793231277
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jul 2020 21:21:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00BDE172F;
	Tue, 28 Jul 2020 21:20:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00BDE172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595964109;
	bh=gDjcYZbTOICEER/aI9jME0q7WCtwyCu+wuaU18h5RG0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vmWFu+eDXW2zpENx+Ducx95au7iHteZPEyukZDae+ieiDKQLHAZunRdoUQ0EirSos
	 0AV+Qy9NbhQPflJuX9W/SfpAJAIByjkgtxaAAnijfKWO+oAtCWAG3CxTT4JJ84YCVe
	 qIC/FF/qhBqy5jd0claJC3Y0njeEYZftBBOAw+3c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 034ADF8021E;
	Tue, 28 Jul 2020 21:20:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CE30F8021E; Tue, 28 Jul 2020 21:20:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01597F8012F
 for <alsa-devel@alsa-project.org>; Tue, 28 Jul 2020 21:19:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01597F8012F
Received: by mail-io1-f67.google.com with SMTP id e64so21928783iof.12
 for <alsa-devel@alsa-project.org>; Tue, 28 Jul 2020 12:19:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ccbJE075Dg4khtgqkJNGNcjYBuurXYxmcn7lYm7LiDk=;
 b=Ll4h83tkoWqcgZI6mt5MGtaLTEI+1FS5Ezwbj/umVtdHscicrfMpKfLwNJxCxJfWGR
 9FVYgN88vBFv1yhRW9SyPRmnfjPqc2KLd1ySxsRr5AF5Nbac8uXjLTJjzbo6aKMTKtM5
 6xLGnfd2YVQlozlYqKzVxbBhOAV9rjUA55KBChsB7adyodMN7VmdEUA3Z+8yxyeSwMCq
 uWr8+vIUGw4hY68zX7e9ocsa/5AVI0x+Y9d9gmVp2u+TF731sa0Z6CTQaIVyvTk+0/I/
 ZHs+Pf5pvfruzQuUHr8b62l3Ue1kppzc0VDzgV1RYEODmBMcYuJJ3ocntKe7/VFIcFBJ
 6hTg==
X-Gm-Message-State: AOAM531AJ30oJhpSLbpfTemiXnkoP0N2ZSUpjMBFhe8Xp431Y1itMeyY
 XZN4OYegyh7iEAq/QD+HPg==
X-Google-Smtp-Source: ABdhPJxSpYWGzrqxj988x4YIzGkL2gF9jlCizwUDFtUeYV2nkG7DE0Cn+EQ8ZGwxQ/OXOAvNrnrXlg==
X-Received: by 2002:a05:6602:2801:: with SMTP id
 d1mr23672137ioe.201.1595963991726; 
 Tue, 28 Jul 2020 12:19:51 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id u12sm7982022ilj.17.2020.07.28.12.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 12:19:51 -0700 (PDT)
Received: (nullmailer pid 2785331 invoked by uid 1000);
 Tue, 28 Jul 2020 19:19:50 -0000
Date: Tue, 28 Jul 2020 13:19:50 -0600
From: Rob Herring <robh@kernel.org>
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: Re: [PATCH 1/2] dt-bindings: sound: add DT bindings for Microchip
 S/PDIF TX Controller
Message-ID: <20200728191950.GA2784080@bogus>
References: <20200728100744.2820112-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200728100744.2820112-1-codrin.ciubotariu@microchip.com>
Cc: devicetree@vger.kernel.org, alexandre.belloni@bootlin.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 nicolas.ferre@microchip.com, robh+dt@kernel.org, lgirdwood@gmail.com,
 ludovic.desroches@microchip.com, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org
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

On Tue, 28 Jul 2020 13:07:43 +0300, Codrin Ciubotariu wrote:
> This patch adds DT bindings for the new Microchip S/PDIF TX Controller
> embedded inside sama7g5 SoCs.
> 
> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> ---
>  .../bindings/sound/mchp,spdiftx.yaml          | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mchp,spdiftx.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

Traceback (most recent call last):
  File "/usr/local/lib/python3.6/dist-packages/jsonschema/validators.py", line 774, in resolve_from_url
    document = self.store[url]
  File "/usr/local/lib/python3.6/dist-packages/jsonschema/_utils.py", line 22, in __getitem__
    return self.store[self.normalize(uri)]
KeyError: 'https://devicetree.org/meta-schemas/core.yaml'

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/usr/local/lib/python3.6/dist-packages/jsonschema/validators.py", line 777, in resolve_from_url
    document = self.resolve_remote(url)
  File "/usr/local/lib/python3.6/dist-packages/jsonschema/validators.py", line 863, in resolve_remote
    with urlopen(uri) as url:
  File "/usr/lib/python3.6/urllib/request.py", line 223, in urlopen
    return opener.open(url, data, timeout)
  File "/usr/lib/python3.6/urllib/request.py", line 532, in open
    response = meth(req, response)
  File "/usr/lib/python3.6/urllib/request.py", line 642, in http_response
    'http', request, response, code, msg, hdrs)
  File "/usr/lib/python3.6/urllib/request.py", line 564, in error
    result = self._call_chain(*args)
  File "/usr/lib/python3.6/urllib/request.py", line 504, in _call_chain
    result = func(*args)
  File "/usr/lib/python3.6/urllib/request.py", line 756, in http_error_302
    return self.parent.open(new, timeout=req.timeout)
  File "/usr/lib/python3.6/urllib/request.py", line 532, in open
    response = meth(req, response)
  File "/usr/lib/python3.6/urllib/request.py", line 642, in http_response
    'http', request, response, code, msg, hdrs)
  File "/usr/lib/python3.6/urllib/request.py", line 570, in error
    return self._call_chain(*args)
  File "/usr/lib/python3.6/urllib/request.py", line 504, in _call_chain
    result = func(*args)
  File "/usr/lib/python3.6/urllib/request.py", line 650, in http_error_default
    raise HTTPError(req.full_url, code, msg, hdrs, fp)
urllib.error.HTTPError: HTTP Error 404: Not Found

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/usr/local/bin/dt-doc-validate", line 64, in <module>
    ret = check_doc(args.yamldt)
  File "/usr/local/bin/dt-doc-validate", line 33, in check_doc
    for error in sorted(dtschema.DTValidator.iter_schema_errors(testtree), key=lambda e: e.linecol):
  File "/usr/local/lib/python3.6/dist-packages/dtschema/lib.py", line 656, in iter_schema_errors
    meta_schema = cls.resolver.resolve_from_url(schema['$schema'])
  File "/usr/local/lib/python3.6/dist-packages/jsonschema/validators.py", line 779, in resolve_from_url
    raise exceptions.RefResolutionError(exc)
jsonschema.exceptions.RefResolutionError: HTTP Error 404: Not Found
Documentation/devicetree/bindings/Makefile:20: recipe for target 'Documentation/devicetree/bindings/sound/mchp,spdiftx.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/sound/mchp,spdiftx.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
Traceback (most recent call last):
  File "/usr/local/lib/python3.6/dist-packages/jsonschema/validators.py", line 774, in resolve_from_url
    document = self.store[url]
  File "/usr/local/lib/python3.6/dist-packages/jsonschema/_utils.py", line 22, in __getitem__
    return self.store[self.normalize(uri)]
KeyError: 'https://devicetree.org/meta-schemas/core.yaml'

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/usr/local/lib/python3.6/dist-packages/jsonschema/validators.py", line 777, in resolve_from_url
    document = self.resolve_remote(url)
  File "/usr/local/lib/python3.6/dist-packages/jsonschema/validators.py", line 863, in resolve_remote
    with urlopen(uri) as url:
  File "/usr/lib/python3.6/urllib/request.py", line 223, in urlopen
    return opener.open(url, data, timeout)
  File "/usr/lib/python3.6/urllib/request.py", line 532, in open
    response = meth(req, response)
  File "/usr/lib/python3.6/urllib/request.py", line 642, in http_response
    'http', request, response, code, msg, hdrs)
  File "/usr/lib/python3.6/urllib/request.py", line 564, in error
    result = self._call_chain(*args)
  File "/usr/lib/python3.6/urllib/request.py", line 504, in _call_chain
    result = func(*args)
  File "/usr/lib/python3.6/urllib/request.py", line 756, in http_error_302
    return self.parent.open(new, timeout=req.timeout)
  File "/usr/lib/python3.6/urllib/request.py", line 532, in open
    response = meth(req, response)
  File "/usr/lib/python3.6/urllib/request.py", line 642, in http_response
    'http', request, response, code, msg, hdrs)
  File "/usr/lib/python3.6/urllib/request.py", line 570, in error
    return self._call_chain(*args)
  File "/usr/lib/python3.6/urllib/request.py", line 504, in _call_chain
    result = func(*args)
  File "/usr/lib/python3.6/urllib/request.py", line 650, in http_error_default
    raise HTTPError(req.full_url, code, msg, hdrs, fp)
urllib.error.HTTPError: HTTP Error 404: Not Found

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/usr/local/bin/dt-mk-schema", line 34, in <module>
    schemas = dtschema.process_schemas(args.schemas, core_schema=(not args.useronly))
  File "/usr/local/lib/python3.6/dist-packages/dtschema/lib.py", line 557, in process_schemas
    sch = process_schema(os.path.abspath(filename))
  File "/usr/local/lib/python3.6/dist-packages/dtschema/lib.py", line 517, in process_schema
    DTValidator.check_schema(schema)
  File "/usr/local/lib/python3.6/dist-packages/dtschema/lib.py", line 668, in check_schema
    meta_schema = cls.resolver.resolve_from_url(schema['$schema'])
  File "/usr/local/lib/python3.6/dist-packages/jsonschema/validators.py", line 779, in resolve_from_url
    raise exceptions.RefResolutionError(exc)
jsonschema.exceptions.RefResolutionError: HTTP Error 404: Not Found
Traceback (most recent call last):
  File "/usr/local/lib/python3.6/dist-packages/jsonschema/validators.py", line 774, in resolve_from_url
    document = self.store[url]
  File "/usr/local/lib/python3.6/dist-packages/jsonschema/_utils.py", line 22, in __getitem__
    return self.store[self.normalize(uri)]
KeyError: 'https://devicetree.org/meta-schemas/core.yaml'

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/usr/local/lib/python3.6/dist-packages/jsonschema/validators.py", line 777, in resolve_from_url
    document = self.resolve_remote(url)
  File "/usr/local/lib/python3.6/dist-packages/jsonschema/validators.py", line 863, in resolve_remote
    with urlopen(uri) as url:
  File "/usr/lib/python3.6/urllib/request.py", line 223, in urlopen
    return opener.open(url, data, timeout)
  File "/usr/lib/python3.6/urllib/request.py", line 532, in open
    response = meth(req, response)
  File "/usr/lib/python3.6/urllib/request.py", line 642, in http_response
    'http', request, response, code, msg, hdrs)
  File "/usr/lib/python3.6/urllib/request.py", line 564, in error
    result = self._call_chain(*args)
  File "/usr/lib/python3.6/urllib/request.py", line 504, in _call_chain
    result = func(*args)
  File "/usr/lib/python3.6/urllib/request.py", line 756, in http_error_302
    return self.parent.open(new, timeout=req.timeout)
  File "/usr/lib/python3.6/urllib/request.py", line 532, in open
    response = meth(req, response)
  File "/usr/lib/python3.6/urllib/request.py", line 642, in http_response
    'http', request, response, code, msg, hdrs)
  File "/usr/lib/python3.6/urllib/request.py", line 570, in error
    return self._call_chain(*args)
  File "/usr/lib/python3.6/urllib/request.py", line 504, in _call_chain
    result = func(*args)
  File "/usr/lib/python3.6/urllib/request.py", line 650, in http_error_default
    raise HTTPError(req.full_url, code, msg, hdrs, fp)
urllib.error.HTTPError: HTTP Error 404: Not Found

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/usr/local/bin/dt-mk-schema", line 34, in <module>
    schemas = dtschema.process_schemas(args.schemas, core_schema=(not args.useronly))
  File "/usr/local/lib/python3.6/dist-packages/dtschema/lib.py", line 557, in process_schemas
    sch = process_schema(os.path.abspath(filename))
  File "/usr/local/lib/python3.6/dist-packages/dtschema/lib.py", line 517, in process_schema
    DTValidator.check_schema(schema)
  File "/usr/local/lib/python3.6/dist-packages/dtschema/lib.py", line 668, in check_schema
    meta_schema = cls.resolver.resolve_from_url(schema['$schema'])
  File "/usr/local/lib/python3.6/dist-packages/jsonschema/validators.py", line 779, in resolve_from_url
    raise exceptions.RefResolutionError(exc)
jsonschema.exceptions.RefResolutionError: HTTP Error 404: Not Found
Documentation/devicetree/bindings/Makefile:53: recipe for target 'Documentation/devicetree/bindings/processed-schema.yaml' failed
make[1]: *** [Documentation/devicetree/bindings/processed-schema.yaml] Error 123
make[1]: *** Deleting file 'Documentation/devicetree/bindings/processed-schema.yaml'
Documentation/devicetree/bindings/Makefile:49: recipe for target 'Documentation/devicetree/bindings/processed-schema-examples.yaml' failed
make[1]: *** [Documentation/devicetree/bindings/processed-schema-examples.yaml] Error 123
make[1]: *** Deleting file 'Documentation/devicetree/bindings/processed-schema-examples.yaml'
Makefile:1347: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1337735

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

